import 'package:hive_flutter/hive_flutter.dart';

import 'package:money_manager/modules/groceries/providers/hive_collection.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class ContainerShoppingCartCollection
    implements CollectionHive<ShoppingCartStore> {
  late Box<ShoppingCartStore> _box;

  static String boxName = 'container_shopping_cart';

  ContainerShoppingCartCollection() {
    _box = Hive.box(boxName);
  }

  @override
  Future<Box<ShoppingCartStore>> init() {
    return Hive.openBox(boxName);
  }

  @override
  Iterable<ShoppingCartStore> get values => _box.values;

  @override
  Map<int, ShoppingCartStore> toMap() {
    return _box.toMap() as Map<int, ShoppingCartStore>;
  }

  @override
  Future<int> add(ShoppingCartStore value) {
    return _box.add(value);
  }

  @override
  Future<Iterable<int>> addAll(Iterable<ShoppingCartStore> values) {
    return _box.addAll(values);
  }

  @override
  Future<void> edit(int key, ShoppingCartStore value) {
    return _box.put(key, value);
  }

  @override
  Future<void> delete(int key) {
    return _box.delete(key);
  }
}
