import 'package:hive/hive.dart';
import 'package:money_manager/modules/groceries/providers/hive_collection.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';

@Deprecated('This should be replaced by Container Cart List Collection')
class ShoppingCartCollection extends CollectionHive<CartItemStore> {
  static const boxName = 'shopping_cart';

  late Box<CartItemStore> _box;

  ShoppingCartCollection() {
    _box = Hive.box(boxName);
  }

  @override
  Future<int> add(CartItemStore value) {
    return _box.add(value);
  }

  @override
  Future<Iterable<int>> addAll(Iterable<CartItemStore> values) {
    return _box.addAll(values);
  }

  @override
  void close() {
    _box.close();
  }

  @override
  Future<void> delete(int key) {
    return _box.delete(key);
  }

  @override
  Future<void> edit(int key, CartItemStore value) {
    return _box.put(key, value);
  }

  @override
  Future<Box<CartItemStore>> init() async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return Hive.openBox(boxName);
    }
  }

  @override
  Future<Box<CartItemStore>> openBox() {
    return Hive.openBox(boxName);
  }

  @override
  Map<int, CartItemStore> toMap() {
    return _box.toMap().cast<int, CartItemStore>();
  }

  @override
  Iterable<CartItemStore> get values => _box.values;
}
