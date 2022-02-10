import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'product_store.g.dart';

class ProductListStore = _ProductListStore with _$ProductListStore;

abstract class _ProductListStore with Store {
  _ProductListStore() {
    // Set reactions
    _disposers = [
      autorun((_) async {
        await _initBox();

        // Init values in list
        final productList = _box.values.toList();

        if (productList.isEmpty) feedbackMessage = 'No hay elementos en lista';

        products = ObservableList.of(productList);
      })
    ];
  }

  late List<ReactionDisposer> _disposers;

  late Box<ProductStore> _box;

  @observable
  String feedbackMessage = '';

  @observable
  ObservableList<ProductStore> products = ObservableList.of([]);

  @observable
  String searchQuery = '';

  @computed
  List<ProductStore> get filteredProducts {
    if (searchQuery.isEmpty) return products;

    return products
        .where((element) =>
            element.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @action
  int findItemIndex(ProductStore product) {
    return products.indexWhere((element) => element.id == product.id);
  }

  @action
  ProductStore add(String name, double unitPrice) {
    final newProduct =
        ProductStore(id: const Uuid().v1(), name: name, unitPrice: unitPrice);

    products.add(newProduct);

    // Save in local data
    _box.add(newProduct);

    return newProduct;
  }

  @action
  void edit(int index, ProductStore product) {
    products[index] = product;

    // Edit in saved data
    _box.putAt(index, product);
  }

  @action
  void remove(int index) {
    products.removeAt(index);

    // Delete from local data
    _box.deleteAt(index);
  }

  @action
  void setSearchQuery(String value) => searchQuery = value;

  @action
  Future<void> _initBox() async {
    const boxName = 'products';
    if (Hive.isBoxOpen(boxName)) {
      _box = Hive.box<ProductStore>(boxName);
    } else {
      _box = await Hive.openBox<ProductStore>(boxName);
    }
  }

  void _disposeBox() {
    _box.close();
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    _disposeBox();
  }
}

@HiveType(typeId: 0, adapterName: 'ProductHiveAdapter')
class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  _ProductStore(
      {required this.id, required this.name, required this.unitPrice});

  @HiveField(0)
  @observable
  String id;

  @HiveField(1)
  @observable
  String name;

  @HiveField(2)
  @observable
  double unitPrice;

  @computed
  String get unitPriceFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(unitPrice);
}
