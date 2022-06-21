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

        if (productList.isEmpty) {
          feedbackMessage = 'No hay productos registrados';
        }

        products = ObservableList.of(productList);
      }),
      reaction((_) => searchQuery, (String q) {
        if (q.isNotEmpty && filteredProducts.isEmpty) {
          feedbackMessage = 'No hay coincidencias';
        } else {
          feedbackMessage = 'No hay productos registrados';
        }
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
  bool get showProgress =>
      searchQuery.isEmpty && products.isEmpty && feedbackMessage.isEmpty;

  @computed
  bool get showFeedbackMessage =>
      filteredProducts.isEmpty && feedbackMessage.isNotEmpty;

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
  int findKeyInMap(ProductStore product) {
    final mapProducts = _box.toMap().cast<int, ProductStore>();

    int resultKey = -1;

    mapProducts.forEach((key, value) {
      if (value.id == product.id) {
        resultKey = key;
      }
    });

    return resultKey;
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
  void edit(ProductStore product) {
    final key = findKeyInMap(product);

    final itemIndex = findItemIndex(product);

    products[itemIndex] = product;

    // Edit in saved data
    _box.put(key, product);
  }

  @action
  void remove(ProductStore product) {
    final key = findKeyInMap(product);

    products.remove(product);

    _box.delete(key);
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

  @action
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'unitPrice': unitPrice};
}
