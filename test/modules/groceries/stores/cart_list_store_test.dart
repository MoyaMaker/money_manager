import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/cart_list_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

void main() {
  group('cart list store', () {
    late ContainerCartListStore store;

    setUp(() {
      store = ContainerCartListStore();
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
      expect(store.containerCartList[0].listName, newName);
    });

    test('adding item to cart', () {
      // Arrange
      expect(store.containerCartList[0].cartList.length, 0);

      final cartItem = CartItemStore(
          product: ProductStore(id: 'id', name: 'name', unitPrice: 12.4),
          quantity: 1);
      // Act
      store.containerCartList[0].add(cartItem);

      // Assert
      expect(store.containerCartList[0].cartList.length, 1);
    });
  });
}
