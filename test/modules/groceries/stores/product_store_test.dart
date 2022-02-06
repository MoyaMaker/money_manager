import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

void main() {
  group('product store: ', () {
    late ProductListStore productListStore;
    const boxName = 'products';
    late Box<ProductStore> box;

    setUpAll(() async {
      const testPath = '\\test\\modules\\groceries\\stores';
      final dir = Directory.current;
      final path = dir.path + testPath;

      Hive.init(path);
      Hive.registerAdapter(ProductHiveAdapter());

      productListStore = ProductListStore();
      if (Hive.isBoxOpen(boxName)) {
        box = Hive.box<ProductStore>(boxName);
      } else {
        box = await Hive.openBox<ProductStore>(boxName);
      }

      // Init values in list
      productListStore.products = ObservableList.of(box.values.toList());
    });

    tearDownAll(() async {
      await Hive.close();
      await Hive.deleteBoxFromDisk(boxName);
      await Hive.deleteFromDisk();
    });

    test('filtered products - products is empty and query is empty', () {
      expect(productListStore.filteredProducts, []);
    });

    test('add item in list', () {
      final newProduct = ProductStore(
        id: '1',
        name: 'Aguacate',
        unitPrice: 83.0,
      );

      productListStore.add(newProduct);

      expect(productListStore.filteredProducts.length, 1);
    });

    test('search item in list', () {
      productListStore.setSearchQuery('cate');

      expect(productListStore.filteredProducts.first.name, 'Aguacate');
    });

    test('create product in hive', () {
      final newProduct = ProductStore(
        id: '2',
        name: 'Cereal',
        unitPrice: 56.0,
      );

      productListStore.createProduct(newProduct);

      expect(box.values.length, 1);
    });

    test('remove item from store', () {
      final oldItem = ProductStore(
        id: '1',
        name: 'Aguacate',
        unitPrice: 83.0,
      );

      productListStore.remove(oldItem);

      expect(productListStore.products.length, 1);
    });

    test('verify box is open', () async {
      productListStore = ProductListStore();

      expect(box.isOpen, true);
    });

    test('dispose store', () {
      productListStore.dispose();

      expect(box.isOpen, false);
    });
  });

  group('product store test', () {
    late ProductStore productStore;

    test('check price formatter', () {
      const expectedResult = r'$235.32';

      productStore = ProductStore(id: '0', name: 'Cereal', unitPrice: 235.32);

      expect(productStore.unitPriceFormatted, expectedResult);
    });
  });
}
