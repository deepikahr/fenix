import 'dart:typed_data';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/models/api_response_models/update_order_history_response/update_order_history_model.dart';
import 'package:fenix_user/models/api_response_models/update_order_socket_response/update_order_socket_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PrinterService {
  final ProviderReference ref;

  PrinterService(this.ref);

  DB get db => ref.read(dbProvider);

  ///printing format for customer reciept
  void _printCustomerReciept(
    NetworkPrinter printer, {
    required List<CartProduct> products,
    String? paymentType,
    String? invoiceNo,
    double? totalAmount,
  }) {
    printer.text(db.getFranchiseName() ?? Constants.restaurantName,
        styles: PosStyles(
          align: PosAlign.center,
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
        linesAfter: 1);

    printer.text((db.getRestaurantName() ?? Constants.restaurantName).tr,
        styles: PosStyles(align: PosAlign.center));
    printer.text('NIF: ${db.getNif() ?? 'N/A'}',
        styles: PosStyles(align: PosAlign.center, bold: true));
    final address = db.getAddress();
    if (address != null) {
      printer.text(address, styles: PosStyles(align: PosAlign.center));
    }
    final number = db.getContactNumber();
    if (number != null) {
      printer.text(number,
          styles: PosStyles(align: PosAlign.center), linesAfter: 1);
    }

    printer.text(
        '${'INVOICE_NUMBER'.tr}: ${invoiceNo == null ? 'N/A' : invoiceNo}',
        styles: PosStyles(align: PosAlign.left, bold: true));
    final now = DateTime.now();
    final dateformatter = DateFormat('MM/dd/yyyy');
    final timeformatter = DateFormat('hh:mm');

    final String date = dateformatter.format(now);
    final String time = timeformatter.format(now);

    printer.text('${'DATE'.tr}: $date     ${'TIME'.tr}: $time',
        styles: PosStyles(align: PosAlign.center), linesAfter: 2);
    printer.hr();
    printer.row([
      PosColumn(
          text: _getPaddedString(
            'CONCEPT'.tr,
            32,
          ),
          width: 8,
          styles: PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
          text: _getPaddedString(
            'PRICE'.tr,
            8,
          ),
          width: 2,
          styles: PosStyles(align: PosAlign.right, bold: true)),
      PosColumn(
          text: _getPaddedString(
            'AMOUNT'.tr,
            8,
          ),
          width: 2,
          styles: PosStyles(align: PosAlign.right, bold: true)),
    ]);
    printer.hr(linesAfter: 1);
    double totalPrice = 0.0;
    for (var i = 0; i < products.length; i++) {
      final productSize = products[i].variant?.sizeName;

      printer.row([
        PosColumn(
            text: _getPaddedString(
                '${products[i].variantQuantity} ${products[i].productName} ${productSize != null ? '[$productSize]' : ''}',
                32),
            width: 8,
            styles: PosStyles(
              align: PosAlign.left,
            )),
        PosColumn(
            text: _getPaddedString(
                '${(products[i].variant?.price ?? (products[i].totalProductPrice / products[i].variantQuantity)).toStringAsFixed(2)}',
                8),
            width: 2,
            styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: _getPaddedString(
                (products[i].totalProductPrice * products[i].variantQuantity)
                    .toStringAsFixed(2),
                8),
            width: 2,
            styles: PosStyles(align: PosAlign.right)),
      ]);
      totalPrice += products[i].totalProductPrice * products[i].variantQuantity;
    }

    printer.emptyLines(1);
    printer.hr();
    printer.row([
      PosColumn(
        text: _getPaddedString('TAX_BASE_PRINTER'.tr, 24),
        width: 6,
        styles: PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true),
      ),
      PosColumn(
          text: _getPaddedString("", 24, prefixPadding: true),
          width: 6,
          styles: PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          )),
    ]);
    printer.hr(ch: '-');
    printer.row([
      PosColumn(
        text: '${'TOTAL'.tr}: ',
        width: 4,
        styles: PosStyles(
          align: PosAlign.left,
          bold: true,
          width: PosTextSize.size2,
        ),
      ),
      PosColumn(
        textEncoded: Uint8List.fromList([8364]),
        width: 2,
        styles: PosStyles(
          align: PosAlign.left,
          bold: true,
          width: PosTextSize.size2,
          codeTable: 'CP1250',
        ),
      ),
      PosColumn(
        text:
            ' ${totalAmount == null || totalAmount == 0.0 ? totalPrice.toStringAsFixed(2) : totalAmount.toStringAsFixed(2)}',
        width: 6,
        styles: PosStyles(
          align: PosAlign.left,
          bold: true,
          width: PosTextSize.size2,
        ),
      ),
    ]);

    printer.hr(ch: '-', linesAfter: 1);
    printer.text(
      '${'TABLE'.tr}: ${db.getTableNumber()}',
      styles: PosStyles(
        align: PosAlign.left,
      ),
    );
    printer.text(
      '${'WAY_TO_PAY'.tr}: ${paymentType == null ? 'N/A' : paymentType.tr}',
      styles: PosStyles(
        align: PosAlign.left,
      ),
    );

    printer.feed(2);
    printer.text('WE_WAIT_FOR_YOU_SOON'.tr,
        styles: PosStyles(align: PosAlign.center, bold: true));
    printer.feed(1);
    printer.cut();
  }

  /// reciept format for cook/kitchen
  void _printKitchenRecieptForModification(
    NetworkPrinter printer, {
    List<UpdateOrderHistoryModel> modificationHistory = const [],
    int? orderID,
  }) {
    printer.text(
      db.getRestaurantName() ??
          db.getFranchiseName() ??
          Constants.restaurantName,
      styles: PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );
    printer.text(
      '--- ${'ORDER_RECEIVED'.tr} ---',
      styles: PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
      linesAfter: 1,
    );
    final now = DateTime.now();
    final dateformatter = DateFormat('MM/dd/yyyy');
    final timeformatter = DateFormat('hh:mm');
    final String date = dateformatter.format(now);
    final String time = timeformatter.format(now);
    printer.text('${'TABLE'.tr}: ${db.getTableNumber()}',
        styles: PosStyles(
          align: PosAlign.left,
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ));
    printer.text('${'DATE'.tr}: $date        ${'TIME'.tr}: $time',
        styles: PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
        linesAfter: 1);
    final baseProducts = modificationHistory[0].localCart?.products ?? [];
    printer.text(
      '${'ORDERID'.tr}: ${orderID ?? 'N/A'}',
      styles: PosStyles(
        align: PosAlign.left,
        bold: true,
        width: PosTextSize.size1,
        height: PosTextSize.size1,
      ),
    );
    printer.emptyLines(1);
    for (var i = 0; i < baseProducts.length; i++) {
      if (baseProducts[i].variantQuantity > 0) {
        final productSize = baseProducts[i].variant?.sizeName;
        printer.row([
          PosColumn(
            text:
                '${_getPaddedString('${baseProducts[i].productName ?? ''} ${productSize != null ? '[$productSize]' : ''}', 40)}',
            width: 10,
          ),
          PosColumn(
              text:
                  '${_getPaddedString('${baseProducts[i].variantQuantity}', 8)}',
              width: 2,
              styles: PosStyles(align: PosAlign.right)),
        ]);
        if (baseProducts[i].selectedAddOnItems.isNotEmpty) {
          printer.text(
            '${'EXTRAS'.tr}:',
            styles: PosStyles(
              align: PosAlign.left,
              bold: false,
              width: PosTextSize.size1,
              height: PosTextSize.size1,
            ),
          );
          for (var j = 0; j < baseProducts[i].selectedAddOnItems.length; j++) {
            printer.text(
              '${baseProducts[i].selectedAddOnItems[j].addOnItemName}(${baseProducts[i].selectedAddOnItems[j].quantity})',
              styles: PosStyles(
                align: PosAlign.left,
                bold: false,
                width: PosTextSize.size1,
                height: PosTextSize.size1,
              ),
            );
          }
        }
        if (baseProducts[i].productInstructions != null &&
            baseProducts[i].productInstructions!.isNotEmpty)
          printer.text(
            '${'INSTRUCTIONS'.tr} -> ${baseProducts[i].productInstructions!}',
            styles: PosStyles(
              align: PosAlign.left,
              bold: false,
              width: PosTextSize.size1,
              height: PosTextSize.size1,
            ),
          );
      }
    }

    for (var i = 0; i < modificationHistory.length; i++) {
      if (modificationHistory[i].action == ACTION_MODIFICATION.accept) {
        final products = modificationHistory[i].localCart?.products ?? [];
        if (products.length > 0) {
          printer.hr();
          printer.text(
            '${"MODIFICATION".tr} ${i + 1}',
            styles: PosStyles(
              align: PosAlign.left,
              bold: true,
              width: PosTextSize.size1,
              height: PosTextSize.size1,
            ),
          );
        }
        printer.emptyLines(1);
        for (var i = 0; i < products.length; i++) {
          if (products[i].modified) {
            final productSize = products[i].variant?.sizeName;

            printer.row([
              PosColumn(
                text:
                    '${_getPaddedString((products[i].productName ?? '') + (productSize != null ? '[$productSize]' : '') + ' (${products[i].variantQuantity < 1 ? 'NEW' : 'QUANTITY'})', 40)}',
                width: 10,
              ),
              PosColumn(
                  text:
                      '${_getPaddedString('${products[i].modifiedQuantity}', 8)}',
                  width: 2,
                  styles: PosStyles(align: PosAlign.right)),
            ]);
            if (products[i].selectedAddOnItems.isNotEmpty) {
              printer.text(
                'Extras:',
                styles: PosStyles(
                  align: PosAlign.left,
                  bold: false,
                  width: PosTextSize.size1,
                  height: PosTextSize.size1,
                ),
              );
              for (var j = 0; j < products[i].selectedAddOnItems.length; j++) {
                printer.text(
                  '${products[i].selectedAddOnItems[j].addOnItemName}(${products[i].selectedAddOnItems[j].quantity})',
                  styles: PosStyles(
                    align: PosAlign.left,
                    bold: false,
                    width: PosTextSize.size1,
                    height: PosTextSize.size1,
                  ),
                );
              }
            }
            if (products[i].productInstructions != null &&
                products[i].productInstructions!.isNotEmpty)
              printer.text(
                '${'INSTRUCTIONS'.tr} -> ${products[i].productInstructions!}',
                styles: PosStyles(
                  align: PosAlign.left,
                  bold: false,
                  width: PosTextSize.size1,
                  height: PosTextSize.size1,
                ),
              );
          }
        }
      }
    }

    printer.feed(3);
    printer.text(
      'PILARBOX',
      styles: PosStyles(
        align: PosAlign.center,
        bold: true,
        width: PosTextSize.size1,
        height: PosTextSize.size1,
      ),
    );
    printer.feed(1);
    printer.cut();
  }

  void _printKitchenReciept(NetworkPrinter printer,
      {required List<CartProduct> products, int? orderID}) {
    printer.text(
      db.getRestaurantName() ??
          db.getFranchiseName() ??
          Constants.restaurantName,
      styles: PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );
    printer.text(
      '--- ${'ORDER_RECEIVED'.tr} ---',
      styles: PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
      linesAfter: 1,
    );
    final now = DateTime.now();
    final dateformatter = DateFormat('MM/dd/yyyy');
    final timeformatter = DateFormat('hh:mm');
    final String date = dateformatter.format(now);
    final String time = timeformatter.format(now);
    printer.text('${'TABLE'.tr}: ${db.getTableNumber()}',
        styles: PosStyles(
          align: PosAlign.left,
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ));
    printer.text('${'DATE'.tr}: $date        ${'TIME'.tr}: $time',
        styles: PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
        linesAfter: 1);
    printer.text(
      '${'ORDERID'.tr}: ${orderID ?? 'N/A'}',
      styles: PosStyles(
        align: PosAlign.left,
        bold: true,
        width: PosTextSize.size1,
        height: PosTextSize.size1,
      ),
    );
    printer.emptyLines(1);
    for (var i = 0; i < products.length; i++) {
      final productSize = products[i].variant?.sizeName;

      printer.row([
        PosColumn(
          text:
              '${_getPaddedString((products[i].productName ?? '') + (productSize != null ? '[$productSize]' : ''), 40)}',
          width: 10,
        ),
        PosColumn(
            text:
                '${_getPaddedString('${products[i].variantQuantity ?? '1'}', 8)}',
            width: 2,
            styles: PosStyles(align: PosAlign.right)),
      ]);
      if (products[i].selectedAddOnItems.isNotEmpty) {
        printer.text(
          '${'EXTRAS'.tr}:',
          styles: PosStyles(
            align: PosAlign.left,
            bold: false,
            width: PosTextSize.size1,
            height: PosTextSize.size1,
          ),
        );
        for (var j = 0; j < products[i].selectedAddOnItems.length; j++) {
          printer.text(
            '${products[i].selectedAddOnItems[j].addOnItemName}(${products[i].selectedAddOnItems[j].quantity})',
            styles: PosStyles(
              align: PosAlign.left,
              bold: false,
              width: PosTextSize.size1,
              height: PosTextSize.size1,
            ),
          );
        }
      }
      if (products[i].productInstructions != null &&
          products[i].productInstructions!.isNotEmpty)
        printer.text(
          '${'INSTRUCTIONS'.tr} -> ${products[i].productInstructions!}',
          styles: PosStyles(
            align: PosAlign.left,
            bold: false,
            width: PosTextSize.size1,
            height: PosTextSize.size1,
          ),
        );
      printer.hr();
    }

    printer.feed(3);
    printer.text(
      'PILARBOX',
      styles: PosStyles(
        align: PosAlign.center,
        bold: true,
        width: PosTextSize.size1,
        height: PosTextSize.size1,
      ),
    );
    printer.feed(1);
    printer.cut();
  }

  Future<String?> printReciept(
      {String? ip,
      List<CartProduct> products = const [],
      required PrinterRecieptType type,
      List<UpdateOrderHistoryModel>? modificationHistory,
      int? orderID,
      String? paymentType,
      double? totalAmount}) async {
    final _paper = PaperSize.mm80;
    final _profile = await CapabilityProfile.load();
    final _printer = NetworkPrinter(_paper, _profile);
    final ipAddress = ip ?? db.getPrinterIpAddress();
    final port = db.getPrinterPort() ?? 9100;
    if (ipAddress != null && ipAddress.isNotEmpty) {
      print('IPAddress: $ipAddress, PORT: $port');
      final PosPrintResult res = await _printer.connect(ipAddress, port: port);
      if (res == PosPrintResult.success) {
        if (type == PrinterRecieptType.CUSTOMER) {
          _printCustomerReciept(_printer,
              products: products,
              invoiceNo: orderID.toString(),
              paymentType: paymentType,
              totalAmount: totalAmount);
        } else if (type == PrinterRecieptType.KITCHEN) {
          if (modificationHistory != null) {
            _printKitchenRecieptForModification(_printer,
                modificationHistory: modificationHistory, orderID: orderID);
          } else {
            _printKitchenReciept(_printer,
                products: products, orderID: orderID);
          }
        }
        _printer.disconnect();
        return null;
      } else {
        return 'CONNECT_ERROR_PRINTER';
      }
    }
    return 'IP_ERROR_PRINTER';
  }

  String _getPaddedString(String text, int length,
      {bool prefixPadding = false}) {
    String value = '';
    if (!prefixPadding) {
      value = text;
    }
    for (var i = text.length; i < length; i++) {
      value += ' ';
    }
    if (prefixPadding) {
      value += text;
    }
    return value;
  }
}

enum PrinterRecieptType { KITCHEN, CUSTOMER }
