import 'package:hive/hive.dart';
import 'package:money_manager/modules/groceries/providers/hive_collection.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class ContainerCartListCollection extends CollectionHive<ShoppingCartStore> {
  static const boxName = 'container_cart_list';

  late Box<ShoppingCartStore> _box;

  ContainerCartListCollection() {
    _box = Hive.box<ShoppingCartStore>(boxName);
  }

  @override
  Future<int> add(ShoppingCartStore value) => _box.add(value);

  @override
  Future<Iterable<int>> addAll(Iterable<ShoppingCartStore> values) =>
      _box.addAll(values);

  @override
  void close() => _box.close();

  @override
  Future<void> delete(int key) => _box.delete(key);

  @override
  Future<void> edit(int key, value) => _box.put(key, value);

  @override
  Future<Box<ShoppingCartStore>> init() async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<ShoppingCartStore>(boxName);
    } else {
      return await Hive.openBox<ShoppingCartStore>(boxName);
    }
  }

  @override
  Map<int, ShoppingCartStore> toMap() {
    return _box.toMap().cast<int, ShoppingCartStore>();
  }

  @override
  Iterable<ShoppingCartStore> get values => _box.values;

  @override
  Future<Box<ShoppingCartStore>> openBox() => Hive.openBox(boxName);
}
