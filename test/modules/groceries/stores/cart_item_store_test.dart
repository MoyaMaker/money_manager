import 'package:flutter_test/flutter_test.dart';

import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

void main() {
  group('check total with promotion', () {
    late CartItemStore cartItemStore;
    late double itemPrice;
    late double subtotal;
    setUp(() {
      cartItemStore = CartItemStore(
          promotion: Promotions.p2x1,
          quantity: 2,
          product: ProductStore(id: '1', name: 'Manzana', unitPrice: 15.0));

      cartItemStore.setShowDetails(true);

      itemPrice = 15.0;
      subtotal = 15.0 * 2;
    });

    test('get total with promotion selected, but not value in discount', () {
      // Arrange
      // Act
      // Default value in if
      cartItemStore.setPromotion(Promotions.percentage);
      // Assert
      expect(cartItemStore.total, subtotal);
    });

    test('get total with promotion percentage', () {
      // Arrange
      const discount = 50.0; // percentage - %
      final expectedResult = subtotal / 2;
      // Act
      cartItemStore.setPromotion(Promotions.percentage);
      cartItemStore.setDiscount(discount);
      // Assert
      expect(cartItemStore.total, expectedResult);
    });

    test('get total with promotion unique price for products', () {
      // Arrange
      const discount = 20.0;
      const expectedResult = discount;
      // Act
      cartItemStore.setPromotion(Promotions.quantity4UniquePrice);
      cartItemStore.setDiscount(discount);
      // Assert
      expect(cartItemStore.total, expectedResult);
    });

    test('get total with promotion points', () {
      // Arrange
      const discount = 10.0;
      final expectedResult = subtotal - discount;

      // Act
      cartItemStore.setPromotion(Promotions.points);
      cartItemStore.setDiscount(discount);

      // Assert
      expect(cartItemStore.total, expectedResult);
    });

    test('get total with promotion 2x1', () {
      // Arrange
      final expectedResult = itemPrice;
      // Act
      cartItemStore.setPromotion(Promotions.p2x1);
      // Assert
      expect(cartItemStore.total, expectedResult);
    });

    test('get total with promotion 3x2', () {
      // Arrange
      final expectedResult = itemPrice * 2;
      // Act
      cartItemStore.setQuantity(3);
      cartItemStore.setPromotion(Promotions.p3x2);
      // Assert
      expect(cartItemStore.total, expectedResult);
    });
    test('get total with promotion 4x3', () {
      // Arrange
      final expectedResult = itemPrice * 3;
      // Act
      cartItemStore.setQuantity(4);
      cartItemStore.setPromotion(Promotions.p4x3);
      // Assert
      expect(cartItemStore.total, expectedResult);
    });

    test('get total with promotion 1 y 70%', () {
      // Arrange
      final discount = double.parse((itemPrice * 0.7).toStringAsFixed(2));
      final expectedResult = itemPrice + (itemPrice - discount);
      // Act
      cartItemStore.setPromotion(Promotions.q1x70percentage);
      // Assert
      expect(cartItemStore.total, expectedResult);
    });

    test('get total with promotion 1 y 50%', () {
      // Arrange
      final expectedResult = itemPrice + (itemPrice / 2);
      // Act
      cartItemStore.setPromotion(Promotions.q1AndHalf);
      // Assert
      expect(cartItemStore.total, expectedResult);
    });

    test('get total without promotion', () {
      // Arrange
      // Act
      cartItemStore.removeDiscount();
      // Assert
      // Default value in the switch
      expect(cartItemStore.total, subtotal);
    });
  });

  group('check subtotal, discount and total', () {
    late CartItemStore cartItemStore;
    late double quantity;
    late double itemPrice;

    setUp(() {
      cartItemStore = CartItemStore(
          quantity: 2,
          product: ProductStore(id: '1', name: 'Manzana', unitPrice: 15.0),
          promotion: Promotions.p2x1);
      quantity = 2.0;
      itemPrice = 15.0;
    });

    test('get discount quantity', () {
      // Arrange
      final expectedResult = itemPrice;
      final expectedResultFormatted = '\$$expectedResult' '0';
      // Act
      // Assert
      expect(cartItemStore.discountAmount, expectedResult);
      expect(cartItemStore.discountAmountFormatted, expectedResultFormatted);
    });

    test('get subtotal', () {
      // Arrange
      final expectedResult = itemPrice * quantity;
      final expectedResultFormatted = '\$$expectedResult' '0';
      // Act
      // Assert
      expect(cartItemStore.subtotal, expectedResult);
      expect(cartItemStore.subtotalFormatted, expectedResultFormatted);
    });

    test('get total', () {
      // Arrange
      final expectedResult = itemPrice;
      final expectedResultFormatted = '\$$expectedResult' '0';
      // Act
      // Assert
      expect(cartItemStore.total, expectedResult);
      expect(cartItemStore.totalFormatted, expectedResultFormatted);
    });

    test('show total and hide subtotal with line through', () {
      // Arrange
      // Act
      cartItemStore.setPromotion(Promotions.notSelected);
      // Assert
      expect(cartItemStore.hasSomeDiscount, false);
    });

    test('show total and hide subtotal with line through', () {
      // Arrange
      // Act
      cartItemStore.setPromotion(Promotions.points);
      // Assert
      expect(cartItemStore.hasSomeDiscount, false);
    });

    test('show subtotal with line through', () {
      // Arrange
      // Act
      cartItemStore.setPromotion(Promotions.points);
      cartItemStore.setDiscount(10.0);
      // Assert
      expect(cartItemStore.hasSomeDiscount, true);
    });
  });

  group('Check promotions extension', () {
    test('enum points', () {
      expect(Promotions.points.value, 'Pago con puntos');
    });

    test('enum quantity4UniquePrice', () {
      expect(Promotions.quantity4UniquePrice.value, r'x$$');
    });

    test('enum percentage', () {
      expect(Promotions.percentage.value, '%');
    });

    test('enum p3x2', () {
      expect(Promotions.p3x2.value, '3x2');
    });

    test('enum p4x3', () {
      expect(Promotions.p4x3.value, '4x3');
    });

    test('enum q1AndHalf', () {
      expect(Promotions.q1AndHalf.value, '1 y 1/2 precio');
    });

    test('enum q1x70percentage', () {
      expect(Promotions.q1x70percentage.value, '1 y 70% precio');
    });
  });
}
