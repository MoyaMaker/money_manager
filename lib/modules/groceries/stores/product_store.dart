import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductListStore = _ProductListStore with _$ProductListStore;

abstract class _ProductListStore with Store {
  _ProductListStore() {
    // Set reactions
    _disposers = [
      autorun((_) async {
        await _initBox();

        // Init values in list
        products = ObservableList.of(_box.values.toList());
      })
    ];
  }

  late List<ReactionDisposer> _disposers;

  late Box<ProductStore> _box;

  @observable
  ObservableList<ProductStore>? products;

  @observable
  String searchQuery = '';

  @computed
  List<ProductStore>? get filteredProducts {
    if (searchQuery.isEmpty) return products;

    return products!
        .where((element) =>
            element.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @action
  void add(ProductStore item) => products!.add(item);

  @action
  void remove(ProductStore item) => products!.remove(item);

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

  Future<int> createProduct(ProductStore product) {
    // TODO: Validate if product already exist
    return _box.add(product);
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
