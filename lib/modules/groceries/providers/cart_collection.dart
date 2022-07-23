import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';

class CartCollection {
  late Box<CartItemStore> _box;
  static const String boxName = 'shopping_cart';

  CartCollection() {
    _box = Hive.box<CartItemStore>(boxName);
  }

  Iterable<CartItemStore> get values => _box.values;

  Map<int, CartItemStore> toMap() => _box.toMap().cast<int, CartItemStore>();

  CartItemStore? getAt(int index) {
    return _box.getAt(index);
  }

  Future<int> add(CartItemStore value) {
    return _box.add(value);
  }

  Future<void> delete(int key) {
    return _box.delete(key);
  }

  Future<void> edit(int key, CartItemStore value) {
    return _box.put(key, value);
  }

  Future<void> editAt(int index, CartItemStore value) {
    return _box.putAt(index, value);
  }
}
