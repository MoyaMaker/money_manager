import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/cart_list_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

void main() {
  group('cart list store', () {
    late ContainerCartListStore store;

    setUpAll(() {
      store = ContainerCartListStore();
    });

    tearDownAll(() {
      store.dispose();
    });

    test('create list default', () {
      expect(store.containerCartList.length, 1);
    });

    test('create a new list', () {
      // Assert
      const expectedListName = 'Nueva lista';
      const expectedLength = 2;
      // Act
      store.createList();
      // Arrange

      expect(store.containerCartList.length, expectedLength);
      expect(store.containerCartList[1].listName, expectedListName);
    });

    test('editing list name', () {
      // Arrange
      expect(store.containerCartList[0].listName, 'Nueva lista');
      const newName = 'HEB';
      // Act
      store.containerCartList[0].editListName(newName);
      // Assert
      expect(newName, store.containerCartList[0].listName);
    });

    test('adding item to cart', () {
      // Arrange
      expect(0, store.containerCartList[0].cartList.length);

      final cartItem = CartItemStore(
          product: ProductStore(id: 'id', name: 'name', unitPrice: 12.4),
          quantity: 1.0);
      // Act
      store.containerCartList[0].add(cartItem);

      // Assert
      expect(1, store.containerCartList[0].cartList.length);
    });

    test('edit item', () {
      // Arrange
      expect(store.containerCartList[0].cartList[0].product.unitPrice, 12.4);
      expect(store.containerCartList[0].cartList[0].quantity, 1.0);

      final cartItem = CartItemStore(
          product: ProductStore(id: 'id', name: 'name', unitPrice: 15.0),
          quantity: 2);
      // Act
      store.containerCartList[0].edit(0, cartItem);
      // Assert
      expect(store.containerCartList[0].cartList[0].product.unitPrice, 15.0);
      expect(store.containerCartList[0].cartList[0].quantity, 2.0);
    });

    test('delete item', () {
      // Arrange
      final cartItem = CartItemStore(
          product: ProductStore(id: 'id', name: 'name', unitPrice: 15.0),
          quantity: 2);
      // Act
      store.containerCartList[0].delete(cartItem);
      // Assert
      expect(0, store.containerCartList[0].cartList.length);
    });
  });
}
