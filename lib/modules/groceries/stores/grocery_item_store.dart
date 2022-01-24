import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'grocery_item_store.g.dart';

class GroceryListStore = _GroceryListStore with _$GroceryListStore;

abstract class _GroceryListStore with Store {
  @observable
  ObservableList<GroceryItemStore> items = ObservableList.of([
    GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
    GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5),
    GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0)
  ]);

  @observable
  String searchQuery = '';

  @computed
  List<GroceryItemStore> get filteredItems {
    if (searchQuery.isEmpty) return items;

    return items
        .where((element) =>
            element.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @action
  void add(GroceryItemStore item) => items.add(item);

  @action
  void remove(GroceryItemStore item) => items.remove(item);

  @action
  void setSearchQuery(String value) => searchQuery = value;
}

class GroceryItemStore = _GroceryItemStore with _$GroceryItemStore;

abstract class _GroceryItemStore with Store {
  _GroceryItemStore(
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
