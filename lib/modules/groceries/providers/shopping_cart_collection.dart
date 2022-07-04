import 'package:hive_flutter/hive_flutter.dart';

import 'package:money_manager/modules/groceries/providers/hive_collection.dart';
import 'package:money_manager/modules/groceries/stores/cart_list_store.dart';

class ShoppingListCollection implements CollectionHive<CartListStore> {
  late Box<CartListStore> _box;

  static String boxName = 'shopping_list';

  ShoppingListCollection() {
    _box = Hive.box(boxName);
  }

  @override
  Future<Box<CartListStore>> init() {
    return Hive.openBox(boxName);
  }

  @override
  Iterable<CartListStore> get values => _box.values;

  @override
  Map<int, CartListStore> toMap() {
    return _box.toMap() as Map<int, CartListStore>;
  }

  @override
  Future<int> add(CartListStore value) {
    return _box.add(value);
  }

  @override
  Future<Iterable<int>> addAll(Iterable<CartListStore> values) {
    return _box.addAll(values);
  }

  @override
  Future<void> edit(int key, CartListStore value) {
    return _box.put(key, value);
  }

  @override
  Future<void> delete(int key) {
    return _box.delete(key);
  }
}
