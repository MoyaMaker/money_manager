import 'package:hive_flutter/hive_flutter.dart';

import 'package:money_manager/modules/groceries/stores/product_store.dart';

class ProductsCollection {
  late Box<ProductStore> _box;

  static String boxName = 'products';

  ProductsCollection() {
    _box = Hive.box<ProductStore>(boxName);
  }

  List<ProductStore> get values => _box.values.toList();

  Map<int, ProductStore> toMap() {
    return _box.toMap().cast<int, ProductStore>();
  }

  Future<int> add(ProductStore value) {
    return _box.add(value);
  }

  Future<Iterable<int>> addAll(Iterable<ProductStore> values) {
    return _box.addAll(values);
  }

  Future<void> edit(int key, ProductStore value) {
    return _box.put(key, value);
  }

  Future<void> delete(int key) {
    return _box.delete(key);
  }
}
