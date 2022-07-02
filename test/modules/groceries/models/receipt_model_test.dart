import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:money_manager/modules/groceries/models/receipt_model.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

void main() {
  group('receipt model', () {
    late Receipt receipt;

    setUp(() {
      receipt = Receipt(
          id: '0',
          storeName: 'Soriana',
          buyDate: DateTime.now(),
          itemsList: [
            CartItemStore(
                product: ProductStore(id: '0', name: 'Item', unitPrice: 150.0))
          ]);
    });

    test('get buy date formatted', () {
      // Arrange
      initializeDateFormatting();

      final months = [
        'enero',
        'febrero',
        'marzo',
        'abril',
        'mayo',
        'junio',
        'julio',
        'agosto',
        'septiembre',
        'octubre',
        'noviembre',
        'diciembre'
      ];

      final d = DateTime.now();

      String day = d.day.toString();

      if (d.day < 10) {
        day = '0${d.day}';
      }

      final expectedDate = '$day ${months[d.month - 1]} ${d.year}';

      expect(receipt.buyDateFormatted, expectedDate);
    });

    test('get subtotal', () {
      expect(receipt.subtotal, r'$150.00');
    });

    test('get discount', () {
      expect(receipt.discount, r'$0.00');
    });

    test('get total', () {
      expect(receipt.total, r'$150.00');
    });

    test('from json', () {
      // Arrange
      final date = DateTime.now();
      final jsonExpected =
          Receipt(id: '0', storeName: 'Soriana', buyDate: date, itemsList: [])
              .toJson();
      final jsonTest = {
        'id': '0',
        'storeName': 'Soriana',
        'buyDate': date.toIso8601String(),
        'itemsList': []
      };
      // Act
      final receiptExpected = Receipt.fromJson(jsonExpected);
      final converted = Receipt.fromJson(jsonTest);
      // Assert
      expect(converted.id, receiptExpected.id);
      expect(converted.storeName, receiptExpected.storeName);
      expect(converted.buyDate, receiptExpected.buyDate);
      expect(converted.itemsList, receiptExpected.itemsList);
    });

    test('to json', () {
      // Arrange
      final date = DateTime.now();
      final jsonExpected =
          Receipt(id: '0', storeName: 'Soriana', buyDate: date, itemsList: [])
              .toJson();
      final jsonTest = {
        'id': '0',
        'storeName': 'Soriana',
        'buyDate': date.toIso8601String(),
        'itemsList': []
      };
      // Act
      // Assert
      expect(jsonExpected, jsonTest);
    });

    test('to string', () {
      // Arrange
      final date = DateTime.now();
      final stringModel =
          Receipt(id: '0', storeName: 'Soriana', buyDate: date, itemsList: [])
              .toString();
      final stringJson =
          '{"id":"0","storeName":"Soriana","buyDate":"${date.toIso8601String()}","itemsList":[]}';
      // Act
      // Assert
      expect(stringModel, stringJson);
    });
  });
}
