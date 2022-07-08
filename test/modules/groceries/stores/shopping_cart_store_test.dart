import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

void main() {
  group('testing computed from store', () {
    late ShoppingCartStore shoppingCartStore;
    const boxName = 'shopping_cart';
    late Box<CartItemStore> box;

    setUpAll(() async {
      const testPath = '\\test\\modules\\groceries\\stores';
      final dir = Directory.current;
      final path = dir.path + testPath;

      Hive.init(path);
      Hive
        ..registerAdapter(ProductHiveAdapter())
        ..registerAdapter(CartItemAdapter())
        ..registerAdapter(PromotionsAdapter());

      shoppingCartStore = ShoppingCartStore();

      if (Hive.isBoxOpen(boxName)) {
        box = Hive.box<CartItemStore>(boxName);
      } else {
        box = await Hive.openBox<CartItemStore>(boxName);
      }

      // Init values in list
      shoppingCartStore.cartItems = ObservableList.of(box.values.toList());
    });

    tearDownAll(() async {
      await Hive.close();
      await Hive.deleteBoxFromDisk(boxName);
      await Hive.deleteFromDisk();
    });

    test('add item in cart', () {
      // Arrange
      final cartItem = CartItemStore(
          promotion: Promotions.p2x1,
          quantity: 2,
          product: ProductStore(id: '0', name: 'Item', unitPrice: 15.0));
      final cartItemSecond = CartItemStore(
          quantity: 2,
          promotion: Promotions.p2x1,
          product: ProductStore(id: '1', name: 'Item 2', unitPrice: 15.0));
      // Act
      shoppingCartStore.addItem(cartItem);
      shoppingCartStore.addItem(cartItemSecond);
      // Expect
      expect(shoppingCartStore.cartItems.first.quantity, 2);
      expect(shoppingCartStore.countItems, 2);
    });

    test('edit item in cart', () {
      // Arrange
      final cartItem = CartItemStore(
          quantity: 4,
          product: ProductStore(id: '0', name: 'Item', unitPrice: 15.0));
      // Act
      shoppingCartStore.editItem(0, cartItem);
      shoppingCartStore.cartItems.first.removeDiscount();
      // Expect
      expect(shoppingCartStore.cartItems.first.quantity, 4);
      expect(shoppingCartStore.countItems, 2);
    });

    test('add same item in cart', () {
      // Arrange
      final cartItem = CartItemStore(
          quantity: 1,
          product: ProductStore(id: '0', name: 'Item', unitPrice: 15.0));
      // Act
      shoppingCartStore.addItem(cartItem);
      // Expect
      expect(shoppingCartStore.cartItems.first.quantity, 5);
      expect(shoppingCartStore.countItems, 2);
    });

    test('count items', () {
      expect(shoppingCartStore.countItems, 2);
    });

    test('check empty list', () {
      expect(shoppingCartStore.hasItems, true);
    });

    test('check date format', () {
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

      // Act
      shoppingCartStore.setBuyDate(d);

      // Assert
      expect(shoppingCartStore.buyDateFormatted, expectedDate);
    });

    test('get subtotal, discount and total', () {
      final d = reaction((_) => shoppingCartStore.selectAll, (bool selected) {
        for (var item in shoppingCartStore.cartItems) {
          item.setHasChecked(selected);
        }
      });

      shoppingCartStore.setSelectAll(true);

      const expectedResultSubtotal = r'$105.00';
      const expectedResultDiscount = r'$15.00';
      const expectedResultTotal = r'$90.00';

      expect(shoppingCartStore.subtotal, expectedResultSubtotal);
      expect(shoppingCartStore.discount, expectedResultDiscount);
      expect(shoppingCartStore.total, expectedResultTotal);
      d();
    });

    test('can continue buy', () {
      expect(shoppingCartStore.canContinueBuy, false);
      expect(shoppingCartStore.canCheckout, true);
    });

    test('remove item', () {
      // Arrange
      final cartItem = shoppingCartStore.cartItems.first;
      // Act
      shoppingCartStore.removeItem(cartItem);
      // Assert
      expect(shoppingCartStore.countItems, 1);
    });

    test('verify box is open', () async {
      shoppingCartStore = ShoppingCartStore();

      expect(box.isOpen, true);
    });

    test('clean cart', () {
      // Arrange
      final d = reaction((_) => shoppingCartStore.selectAll, (bool selected) {
        for (var item in shoppingCartStore.cartItems) {
          item.setHasChecked(selected);
        }
      });

      shoppingCartStore.setSelectAll(true);
      shoppingCartStore.setStoreName('Soriana');
      // Act
      shoppingCartStore.cleanCart();
      // Assert
      expect(shoppingCartStore.storeName, '');
      expect(shoppingCartStore.countItems, 0);
      expect(shoppingCartStore.hasItems, false);
      d();
    });

    test('dispose store', () {
      shoppingCartStore.dispose();

      expect(box.isOpen, false);
    });
  });
}
