import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';
import 'package:money_manager/modules/groceries/models/receipt_model.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

void main() {
  group('check status of store', () {
    late ReceiptHistoryStore receiptHistoryStore;
    const boxName = 'receipt_history';
    late Box<Receipt> box;

    setUpAll(() async {
      const testPath = '\\test\\modules\\groceries\\stores';
      final dir = Directory.current;
      final path = dir.path + testPath;

      Hive.init(path);
      Hive
        ..registerAdapter(ProductHiveAdapter())
        ..registerAdapter(CartItemAdapter())
        ..registerAdapter(PromotionsAdapter())
        ..registerAdapter(ReceiptAdapter());

      receiptHistoryStore = ReceiptHistoryStore();

      if (Hive.isBoxOpen(boxName)) {
        box = Hive.box<Receipt>(boxName);
      } else {
        box = await Hive.openBox<Receipt>(boxName);
      }

      // Init values in list
      receiptHistoryStore.shoppedItems = ObservableList.of(box.values.toList());
    });

    tearDownAll(() async {
      await Hive.close();
      await Hive.deleteBoxFromDisk(boxName);
      await Hive.deleteFromDisk();
    });

    test('get count items', () {
      expect(receiptHistoryStore.countItems, 0);
    });
    test('has items', () {
      expect(receiptHistoryStore.hasItems, false);
    });

    test('add item in store', () {
      final shoppingCart = ShoppingCartStore(
          id: '0',
          storeName: 'Soriana',
          buyDate: DateTime.now(),
          items: ObservableList.of([
            CartItemStore(
                quantity: 2,
                product: ProductStore(id: '0', name: 'Item', unitPrice: 15.0))
          ]));

      receiptHistoryStore.saveReceipt(shoppingCart);

      expect(receiptHistoryStore.countItems, 1);
    });

    test('verify box is open', () async {
      receiptHistoryStore = ReceiptHistoryStore();

      expect(box.isOpen, true);
    });

    test('dispose store', () {
      receiptHistoryStore.dispose();

      expect(box.isOpen, false);
    });
  });
}
