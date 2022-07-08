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

    test('add item in store', () async {
      final shoppingCart = ShoppingCartStore(storeName: 'Soriana');

      shoppingCart.addItem(CartItemStore(
          quantity: 2,
          product: ProductStore(id: '0', name: 'Item', unitPrice: 15.0)));

      await receiptHistoryStore.saveReceipt(
          shoppingCart.id!,
          shoppingCart.storeName,
          shoppingCart.buyDate,
          shoppingCart.checkedItems);

      expect(receiptHistoryStore.countItems, 1);
    });

    test('delete item from list and hive', () async {
      // Arrange
      final shoppingCart = ShoppingCartStore(storeName: 'HEB');

      shoppingCart.addItem(CartItemStore(
          quantity: 3,
          product: ProductStore(id: '1', name: 'Item2 ', unitPrice: 23.0)));

      // This item should be order in list, so this will be the first item in the list
      receiptHistoryStore.saveReceipt(shoppingCart.id!, shoppingCart.storeName,
          shoppingCart.buyDate, shoppingCart.checkedItems);

      final receiptToDelete = receiptHistoryStore.shoppedItems[1];
      // Act
      expect(receiptHistoryStore.countItems, 2);
      await receiptHistoryStore.delete(receiptToDelete);
      // Assert
      expect(receiptHistoryStore.countItems, 1);
      expect(receiptHistoryStore.shoppedItems.first.storeName, "HEB");
    });

    test('restore all receipts', () async {
      // Arrange
      const expectedReceipts = 2;
      final list = <Receipt>[
        Receipt(
            id: 'abc',
            storeName: 'Walmart',
            buyDate: DateTime.now(),
            itemsList: [
              CartItemStore(
                  quantity: 2,
                  product:
                      ProductStore(id: '0', name: 'Item', unitPrice: 15.0)),
              CartItemStore(
                  quantity: 3,
                  product:
                      ProductStore(id: '1', name: 'Item2 ', unitPrice: 23.0))
            ])
      ];

      // Act
      final intList = await receiptHistoryStore.restoreReceipts(list);
      // Assert
      expect(intList.length, list.length);
      expect(receiptHistoryStore.countItems, expectedReceipts);
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
