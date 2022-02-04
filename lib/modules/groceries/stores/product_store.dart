import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductListStore = _ProductListStore with _$ProductListStore;

abstract class _ProductListStore with Store {
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
  void add(ProductStore item) => products.add(item);

  @action
  void remove(ProductStore item) => products.remove(item);

  @action
  void setSearchQuery(String value) => searchQuery = value;
}

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  _ProductStore(
      {required this.id, required this.name, required this.unitPrice});

  @observable
  String id;

  @observable
  String name;

  @observable
  double unitPrice;

  @computed
  String get unitPriceFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(unitPrice);
}
