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

  Future<int> add(value) {
    return _box.add(value);
  }

  Future<void> delete(key) {
    return _box.delete(key);
  }

  Future<void> edit(key, value) {
    return _box.put(key, value);
  }
}
