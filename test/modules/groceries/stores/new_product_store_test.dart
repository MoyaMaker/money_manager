import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/new_product_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

void main() {
  group('New product store: ', () {
    late FormNewProduct store;
    const boxName = 'products';
    late Box<ProductStore> box;

    late List<ReactionDisposer> disposers;

    setUpAll(() async {
      const testPath = '\\test\\modules\\groceries\\stores';
      final dir = Directory.current;
      final path = dir.path + testPath;

      Hive.init(path);
      Hive.registerAdapter(ProductHiveAdapter());

      store = FormNewProduct();

      if (Hive.isBoxOpen(boxName)) {
        box = Hive.box<ProductStore>(boxName);
      } else {
        box = await Hive.openBox<ProductStore>(boxName);
      }

      disposers = [
        reaction(
            (_) => store.name, (String value) => store.validateName(value)),
        reaction((_) => store.unitPrice,
            (String value) => store.validateUnitPrice(value)),
        reaction((_) => store.quantity,
            (String value) => store.validateQuantity(value))
      ];

      box.add(ProductStore(id: 'id', name: 'Aguacate', unitPrice: 83.0));
    });

    tearDownAll(() async {
      for (var d in disposers) {
        d();
      }

      store.dispose();

      await Hive.close();
      await Hive.deleteBoxFromDisk(boxName);
      await Hive.deleteFromDisk();
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

    test('Validate name without error', () async {
      // Arrange
      const nameProduct = 'Aaa';
      // Act
      store.setName(nameProduct);
      await store.checkNameExist(store.name);
      // Assert
      expect(store.error.name == null, true);
    });

    test('Validate if product exist', () async {
      // Arrange
      const nameProduct = 'Aguacate';
      // Act
      store.setName(nameProduct);
      await store.checkNameExist(store.name);
      // Assert
      expect(store.error.name != null, true);
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

    test('Can save product', () async {
      // Arrange
      // Act
      store.setName('Nuevo producto');
      store.validateAll();
      await store.checkNameExist(store.name);
      // Assert
      expect(store.canSave, true);
    });

    test('box is open', () {
      expect(box.isOpen, true);
    });
  });
}
