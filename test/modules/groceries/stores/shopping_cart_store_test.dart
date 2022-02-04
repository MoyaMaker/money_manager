import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

void main() {
  group('validate init store when is empty', () {
    test('set default values in store when init', () {
      final store = ShoppingCartStore();

      expect(store.hasItems, false);
      expect(store.countItems, 0);
    });
  });

  group('testing computed from store', () {
    late ShoppingCartStore shoppingCartStore;

    setUp(() {
      shoppingCartStore = ShoppingCartStore(
          items: ObservableList.of([
        CartItemStore(
            item: GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
            quantity: 2,
            promotion: Promotions.p2x1),
        CartItemStore(
            item: GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5)),
        CartItemStore(
            item: GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0))
      ]));
    });

    test('count items', () {
      expect(shoppingCartStore.countItems, 3);
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

      // Assert
      expect(shoppingCartStore.buyDateFormatted, expectedDate);
    });

    test('get subtotal, discount and total', () {
      const expectedResultSubtotal = r'$136.50';
      const expectedResultDiscount = r'$15.00';
      const expectedResultTotal = r'$121.50';

      expect(shoppingCartStore.subtotal, expectedResultSubtotal);
      expect(shoppingCartStore.discount, expectedResultDiscount);
      expect(shoppingCartStore.total, expectedResultTotal);
    });

    test('can continue buy', () {
      expect(shoppingCartStore.canContinueBuy, false);
    });
  });

  group('adding items in cart', () {
    late ShoppingCartStore shoppingCartStore;

    setUp(() {
      shoppingCartStore = ShoppingCartStore(
          items: ObservableList.of([
        CartItemStore(
            item: GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0)),
      ]));
    });

    test('add item in cart', () {
      // Arrange
      final cartItem = CartItemStore(
          item: GroceryItemStore(id: '0', name: 'Item', unitPrice: 15.0));
      // Act
      shoppingCartStore.addItem(cartItem);
      // Expect
      expect(shoppingCartStore.items.first.quantity, 1);
      expect(shoppingCartStore.countItems, 2);
    });

    test('add same item in cart', () {
      // Arrange
      final cartItem = CartItemStore(
          quantity: 4,
          item: GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0));
      // Act
      shoppingCartStore.addItem(cartItem);
      // Expect
      expect(shoppingCartStore.items.first.quantity, 4);
      expect(shoppingCartStore.countItems, 1);
    });
  });

  group('remove items from cart', () {
    late ShoppingCartStore shoppingCartStore;

    setUp(() {
      shoppingCartStore = ShoppingCartStore(
          items: ObservableList.of([
        CartItemStore(
            item: GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
            quantity: 2,
            promotion: Promotions.p2x1),
        CartItemStore(
            item: GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5)),
        CartItemStore(
            item: GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0))
      ]));
    });

    test('remove item', () {
      // Arrange
      final cartItem = shoppingCartStore.items.first;
      // Act
      shoppingCartStore.removeItem(cartItem);
      // Assert
      expect(shoppingCartStore.countItems, 2);
    });

    test('clean cart', () {
      // Arrange
      shoppingCartStore.setStoreName('Soriana');
      shoppingCartStore.setBuyDate(DateTime(2021, 7, 12));
      // Act
      shoppingCartStore.cleanCart();
      // Assert
      expect(shoppingCartStore.storeName, '');
      expect(shoppingCartStore.countItems, 0);
    });
  });
}
