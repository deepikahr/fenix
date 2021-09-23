import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrinterService {
  final ProviderReference ref;

  PrinterService(this.ref);

  DB get db => ref.read(dbProvider);

  void _testReceipt(NetworkPrinter printer,
      {String? waiterName, required List<CartProduct> products}) {
    final dateTime = DateTime.now();
    printer.text(
      '${Constants.restaurantName}',
      styles: PosStyles(
        align: PosAlign.center,
      ),
    );
    if (waiterName != null) {
      printer.text(
        '✱✱✱ ${waiterName} ✱✱✱',
        styles: PosStyles(
          align: PosAlign.center,
        ),
        linesAfter: 1,
      );
    }
    printer.emptyLines(2);
    printer.text(
      'Table no.:   #${db.getTableNumber() ?? 3}',
      styles: PosStyles(
        align: PosAlign.left,
      ),
    );
    printer.hr(ch: '-', linesAfter: 1);
    printer.text(
      'Date: ${dateTime.day}.${dateTime.month}.${dateTime.year}',
      styles: PosStyles(
        align: PosAlign.left,
      ),
    );
    printer.text(
      'Time: ${dateTime.hour}:${dateTime.minute}',
      styles: PosStyles(
        align: PosAlign.right,
      ),
    );
    printer.hr(ch: '-', linesAfter: 1);
    for (var i = 0; i < products.length; i++) {
      printer.text(
        '${products[i].productName}',
        styles: PosStyles(
          align: PosAlign.left,
        ),
        linesAfter: 1,
      );
      printer.text(
        '${products[i].variantQuantity}',
        styles: PosStyles(
          align: PosAlign.right,
        ),
      );
    }

    printer.hr(ch: '-', linesAfter: 1);
    printer.feed(2);
    printer.cut();
  }

  Future<bool> printReciept(
      {String? waiterName,
      String? ip,
      List<CartProduct> products = const []}) async {
    final _paper = PaperSize.mm80;
    final _profile = await CapabilityProfile.load();
    final _printer = NetworkPrinter(_paper, _profile);
    final ipAddress = db.getPrinterIpAddress();
    if (ipAddress != null && ipAddress.isNotEmpty) {
      final PosPrintResult res =
          await _printer.connect(ip ?? ipAddress, port: 9100);
      if (res == PosPrintResult.success) {
        _testReceipt(_printer, waiterName: waiterName, products: products);
        _printer.disconnect();
        return true;
      }
    }
    return false;
  }
}
