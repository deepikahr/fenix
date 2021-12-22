import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_request_models/update_cart/update_cart.dart';
import 'package:fenix_user/models/api_request_models/update_product/update_product.dart';
import 'package:fenix_user/models/api_response_models/order_response/order_response.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'cart_screen_state.dart';

class CartScreenNotifier extends StateNotifier<CartScreenState> {
  final ProviderReference ref;
  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  CartNotifier get cartState {
    return ref.read(cartProvider.notifier);
  }

  Cart? get cart {
    return ref.read(cartProvider);
  }

  CartScreenNotifier(this.ref) : super(CartScreenState());

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }

  Future<void> updateQuantity(ProductDetailsResponse product, bool increased,
      {bool returnToPreviousQuantity = false}) async {
    late ProductDetailsResponse newProduct;
    if (db.getOrderId() != null) {
      newProduct = product.copyWith(
        modifiedQuantity: returnToPreviousQuantity
            ? getLastOrderedQuantityOfProduct(product)
            : product.modifiedQuantity != null
                ? product.modifiedQuantity! + (increased ? 1 : -1)
                : product.variantQuantity + (increased ? 1 : -1),
      );
      newProduct = newProduct.copyWith(
        modified: db.getOrderId() != null &&
            (newProduct.modifiedQuantity == null ||
                (newProduct.variantQuantity != newProduct.modifiedQuantity)),
      );
    } else {
      newProduct = product.copyWith(
        variantQuantity: product.variantQuantity + (increased ? 1 : -1),
      );
    }
    print('cart ----> ${cart!.toJson()}');
    print(
        'IS MODIFIED: ${newProduct.modified}  NORMALQUANTITY: ${newProduct.variantQuantity}  MODIFIEDQUANTITY: ${newProduct.modifiedQuantity ?? 'N/A'}');
    if ((newProduct.modified &&
            (newProduct.modifiedQuantity ?? newProduct.variantQuantity) > 0) ||
        newProduct.variantQuantity > 0) {
      var products = cart!.products;
      products = products.map((p) {
        if (p == product) {
          return newProduct;
        }
        return p;
      }).toList();

      await cartState.updateCart(cart?.copyWith(products: products));
    } else {
      await cartState.updateCart(
          cart?.copyWith(products: cart!.products..remove(product)));

      if (cart!.products.isEmpty) {
        await cartState.deleteCart();
      }
    }
    await updateModifiedStatusOfCart();
    await updateGrandTotal();
  }

  Future<void> updateModifiedStatusOfCart() async {
    if (cart?.products.isNotEmpty ?? false) {
      await cartState.updateCart(
          cart?.copyWith(modifiedCart: getModifiedStatusFromProducts()));
    }
  }

  bool getModifiedStatusFromProducts() {
    for (var product in cart!.products) {
      if (product.modified) {
        return product.modified;
      }
    }
    return false;
  }

  Future<void> removeProduct(ProductDetailsResponse product) async {
    final removeProduct =
        db.getOrderId() == null || product.variantQuantity < 1;

    if (removeProduct) {
      await cartState.updateCart(
          cart?.copyWith(products: cart!.products..remove(product)));
      if (cart!.products.isEmpty) {
        await cartState.deleteCart();
      } else {
        await updateGrandTotal();
      }
      await updateModifiedStatusOfCart();
    } else {
      updateQuantity(product, false, returnToPreviousQuantity: true);
    }
  }

  Future<void> updateGrandTotal() async {
    // db.removeOrderId();
    if (cart?.products.isNotEmpty ?? false) {
      final total = cart!.products.map(
        (e) {
          return e.totalProductPrice * e.variantQuantity;
        },
      ).reduce((_, __) => _ + __);
      final tax = cart!.products.map(
        (e) {
          return e.tax;
        },
      ).reduce((_, __) => _ + __);
      final subTotal = total;
      final grandTotal = total;

      await cartState.updateCart(cart?.copyWith(
          subTotal: subTotal, grandTotal: grandTotal, taxTotal: tax));
    }
  }

  Future<OrderResponse?> createOrder() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.createOrder(
      cart!,
    );
    db.saveOrderId(response!.id);
    state = state.copyWith.call(isLoading: false, orderResponse: response);
    return response;
  }

  UpdateProduct createUpdateProduct(ProductDetailsResponse product) {
    return UpdateProduct(
        productId: product.id,
        sizeName: product.variant?.sizeName,
        quantity: product.modifiedQuantity ?? product.variantQuantity,
        addOnItems: product.selectedAddOnItems,
        productDetails: product,
        modified_status: product.variantQuantity == 0
            ? MODIFIED_STATUS.new_item
            : MODIFIED_STATUS.quanity_update);
  }

  Future<String?> updateOrder() async {
    state = state.copyWith.call(isUpdateLoading: true);

    UpdateCart updateCart =
        UpdateCart(orderId: db.getOrderId(), localCart: cart);
    print('Update cart Response: $updateCart');
    final updateResponse = await api.updateOrder(updateCart);
    state = state.copyWith.call(
      isUpdateLoading: false,
    );
    return updateResponse;
  }

  int getCurrentQuanityOfProduct(ProductDetailsResponse product) =>
      product.modified
          ? product.modifiedQuantity ?? product.variantQuantity
          : product.variantQuantity;

  int getLastOrderedQuantityOfProduct(ProductDetailsResponse product) =>
      db.getOrderId() != null ? product.variantQuantity : 0;
}
