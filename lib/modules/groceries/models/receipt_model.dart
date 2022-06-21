import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';

part 'receipt_model.g.dart';

@HiveType(typeId: 3, adapterName: 'ReceiptAdapter')
class Receipt {
  @HiveField(0)
  String id;
  @HiveField(1)
  String storeName;
  @HiveField(2)
  DateTime buyDate;
  @HiveField(3)
  List<CartItemStore> itemsList;

  Receipt(
      {required this.id,
      required this.storeName,
      required this.buyDate,
      required this.itemsList});

  String get buyDateFormatted =>
      DateFormat('dd MMMM yyyy', 'es_MX').format(buyDate);

  String get subtotal {
    double subtotal = 0.0;

    for (var item in itemsList) {
      subtotal += item.subtotal;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  String get discount {
    double discount = 0.0;

    for (var item in itemsList) {
      discount += item.discountAmount;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(discount);
  }

  String get total {
    double subtotal = 0.0;

    for (var item in itemsList) {
      subtotal += item.total;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'storeName': storeName,
        'buyDate': buyDate,
        'itemsList': itemsList
      };
}
