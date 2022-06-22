import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/new_product_store.dart';

void main() {
  group('New product store: ', () {
    late FormNewProduct store;

    late List<ReactionDisposer> disposers;

    setUpAll(() {
      store = FormNewProduct();

      disposers = [
        reaction(
            (_) => store.name, (String value) => store.validateName(value)),
        reaction((_) => store.unitPrice,
            (String value) => store.validateUnitPrice(value)),
        reaction((_) => store.quantity,
            (String value) => store.validateQuantity(value))
      ];
    });

    tearDownAll(() {
      for (var d in disposers) {
        d();
      }

      store.dispose();
    });

    test('Validate name empty', () {
      // Arrange
      const nameProduct = '';
      // Act
      store.validateName(nameProduct);
      // Assert
      expect(store.error.name != null, true);
    });

    test('Validate name with error min length', () {
      // Arrange
      const nameProduct = 'Aa';
      // Act
      store.setName(nameProduct);
      // Assert
      expect(store.error.name != null, true);
    });

    test('Validate name without error', () {
      // Arrange
      const nameProduct = 'Aaa';
      // Act
      store.setName(nameProduct);
      // Assert
      expect(store.error.name == null, true);
    });

    test('Validate unit price empty', () {
      // Arrange
      const unitPrice = '';
      // Act
      store.validateUnitPrice(unitPrice);
      // Assert
      expect(store.error.unitPrice != null, true);
    });

    test('Validate unit price error not double', () {
      // Arrange
      const unitPrice = 'a';
      // Act
      store.setUnitPrice(unitPrice);
      // Assert
      expect(store.error.unitPrice != null, true);
    });

    test('Validate unit price error no min value', () {
      // Arrange
      const unitPrice = '0.001';
      // Act
      store.setUnitPrice(unitPrice);
      // Assert
      expect(store.error.unitPrice != null, true);
    });

    test('Validate unit price without errors', () {
      // Arrange
      const unitPrice = '0.1';
      // Act
      store.setUnitPrice(unitPrice);
      // Assert
      expect(store.error.unitPrice == null, true);
    });

    test('Validate quantity empty', () {
      // Arrange
      const quantity = '';
      // Act
      store.validateQuantity(quantity);
      // Assert
      expect(store.error.quantity != null, true);
    });

    test('Validate quantity not double', () {
      // Arrange
      const quantity = 'a';
      // Act
      store.validateQuantity(quantity);
      // Assert
      expect(store.error.quantity != null, true);
    });

    test('Validate quantity error min value', () {
      // Arrange
      const quantity = '0.001';
      // Act
      store.setQuantity(quantity);
      // Assert
      expect(store.error.quantity != null, true);
    });

    test('Validate quantity without errors', () {
      // Arrange
      const quantity = '0.1';

      // Act
      store.setQuantity(quantity);
      // Assert
      expect(store.error.quantity == null, true);
    });

    test('Can save product', () {
      // Arrange
      // Act
      store.validateAll();
      // Assert
      expect(store.canSave, true);
    });
  });
}
