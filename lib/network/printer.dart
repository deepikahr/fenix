import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';


class PrinterService {
  final ProviderReference ref;

  PrinterService(this.ref);

  DB get db => ref.read(dbProvider);

  // void _testReceipt(NetworkPrinter printer,
  //     {String? waiterName, required List<CartProduct> products}) {
  //   final dateTime = DateTime.now();
  //   printer.text(
  //     '${Constants.restaurantName}',
  //     styles: PosStyles(
  //       align: PosAlign.center,
  //     ),
  //   );
  //   if (waiterName != null) {
  //     printer.text(
  //       '✱✱✱ ${waiterName} ✱✱✱',
  //       styles: PosStyles(
  //         align: PosAlign.center,
  //       ),
  //       linesAfter: 1,
  //     );
  //   }
  //   printer.emptyLines(2);
  //   printer.text(
  //     'Table no.:   #${db.getTableNumber() ?? 3}',
  //     styles: PosStyles(
  //       align: PosAlign.left,
  //     ),
  //   );
  //   printer.hr(ch: '-', linesAfter: 1);
  //   printer.text(
  //     'Date: ${dateTime.day}.${dateTime.month}.${dateTime.year}',
  //     styles: PosStyles(
  //       align: PosAlign.left,
  //     ),
  //   );
  //   printer.text(
  //     'Time: ${dateTime.hour}:${dateTime.minute}',
  //     styles: PosStyles(
  //       align: PosAlign.right,
  //     ),
  //   );
  //   printer.hr(ch: '-', linesAfter: 1);
  //   for (var i = 0; i < products.length; i++) {
  //     printer.text(
  //       '${products[i].productName}',
  //       styles: PosStyles(
  //         align: PosAlign.left,
  //       ),
  //       linesAfter: 1,
  //     );
  //     printer.text(
  //       '${products[i].variantQuantity}',
  //       styles: PosStyles(
  //         align: PosAlign.right,
  //       ),
  //     );
  //   }

  //   printer.hr(ch: '-', linesAfter: 1);
  //   printer.feed(2);
  //   printer.cut();
  // }

  ///printing format for customer reciept
  void _printCustomerReciept(
    NetworkPrinter printer, {
    required List<CartProduct> products,
    String? paymentType,
    String? invoiceNo,
    double? totalAmount,
  }) {
    printer.text(Constants.restaurantName,
        styles: PosStyles(
          align: PosAlign.center,
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
        linesAfter: 1);

    printer.text('LEGAL NAME', styles: PosStyles(align: PosAlign.center));
    printer.text('NIF: FISCAL BUSINESS NUMBER',
        styles: PosStyles(align: PosAlign.center, bold: true));
    printer.text(Constants.restaurantAddress,
        styles: PosStyles(align: PosAlign.center));
    printer.text('PHONE NUMBER',
        styles: PosStyles(align: PosAlign.center), linesAfter: 1);

    printer.text('Invoice number: ${invoiceNo == null ? 'N/A' : invoiceNo}',
        styles: PosStyles(align: PosAlign.left, bold: true));
    final now = DateTime.now();
    final dateformatter = DateFormat('MM/dd/yyyy');
    final timeformatter = DateFormat('hh:mm');

    final String date = dateformatter.format(now);
    final String time = timeformatter.format(now);

    printer.text('DATE: $date     TIME: $time',
        styles: PosStyles(align: PosAlign.center), linesAfter: 2);
    printer.hr();
    printer.row([
      PosColumn(
          text: 'Concept',
          width: 8,
          styles: PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
          text: 'Price',
          width: 2,
          styles: PosStyles(align: PosAlign.right, bold: true)),
      PosColumn(
          text: 'Amount',
          width: 2,
          styles: PosStyles(align: PosAlign.right, bold: true)),
    ]);
    printer.hr(linesAfter: 1);
    double totalPrice = 0.0;
    for (var i = 0; i < products.length; i++) {
      printer.row([
        PosColumn(
            text: '${products[i].variantQuantity} ${products[i].productName}',
            width: 8,
            styles: PosStyles(
              align: PosAlign.left,
            )),
        PosColumn(
            text:
                '${(products[i].variant?.price ?? (products[i].totalProductPrice / products[i].variantQuantity)).toStringAsFixed(2)}',
            width: 2,
            styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: products[i].totalProductPrice.toStringAsFixed(2),
            width: 2,
            styles: PosStyles(align: PosAlign.right)),
      ]);
      totalPrice += products[i].totalProductPrice;
    }

    printer.emptyLines(1);
    printer.hr();
    final tax = totalPrice * (10 / 100);
    printer.row([
      PosColumn(
        text: 'I.V.A/ TAX BASE 10.00%',
        width: 6,
        styles: PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true),
      ),
      PosColumn(
          text: tax.toStringAsFixed(2),
          width: 6,
          styles: PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          )),
    ]);
    totalPrice += tax;
    printer.hr(ch: '-');
    printer.text(
      'TOTAL: ${totalAmount ?? totalPrice} ${Constants.currency}',
      styles: PosStyles(
        align: PosAlign.right,
        bold: true,
        width: PosTextSize.size3,
      ),
    );
    printer.hr(ch: '-', linesAfter: 1);
    printer.text(
      'TABLE: ${db.getTableNumber()}',
      styles: PosStyles(
        align: PosAlign.left,
      ),
    );
    printer.text(
      'WAY TO PAY: ${paymentType == null ? 'N/A' : paymentType}',
      styles: PosStyles(
        align: PosAlign.left,
      ),
    );

    printer.feed(2);
    printer.text('THANK YOU FOR YOUR VISIT',
        styles: PosStyles(align: PosAlign.center, bold: true));
    printer.feed(1);
    printer.cut();
  }

  /// reciept format for cook/kitchen
  void _printKitchenReciept(NetworkPrinter printer,
      {required List<CartProduct> products}) {
    printer.text(
      Constants.restaurantName,
      styles: PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );
    printer.text(
      '--- ORDER RECEIVED ---',
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
    printer.text('TABLE: ${db.getTableNumber()}',
        styles: PosStyles(
          align: PosAlign.left,
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ));
    printer.text('DATE: $date        TIME: $time',
        styles: PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
        linesAfter: 1);
    for (var i = 0; i < products.length; i++) {
      printer.row([
        PosColumn(
          text: '${products[i].productName}',
          width: 8,
        ),
        PosColumn(
            text: '${products[i].variantQuantity}',
            width: 4,
            styles: PosStyles(align: PosAlign.right)),
      ]);
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
      String? paymentType,
      String? invoiceNo,
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
              invoiceNo: invoiceNo,
              paymentType: paymentType,
              totalAmount: totalAmount);
        } else if (type == PrinterRecieptType.KITCHEN) {
          _printKitchenReciept(_printer, products: products);
        }
        _printer.disconnect();
        return null;
      } else {
        return 'Couldn\'t Connect to the Printer';
      }
    }
    return 'Printer IP not specified';
  }
}

enum PrinterRecieptType { KITCHEN, CUSTOMER }
