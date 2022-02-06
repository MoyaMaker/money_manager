import 'package:mobx/mobx.dart';

import 'shopping_cart_store.dart';

part 'shopping_history_store.g.dart';

class ShoppingHistoryStore = _ShoppingHistoryStore with _$ShoppingHistoryStore;

abstract class _ShoppingHistoryStore with Store {
  @observable
  ObservableList<ShoppingCartStore> shoppedItems = ObservableList.of([]);

  @computed
  int get countItems => shoppedItems.length;

  @computed
  bool get hasItems => shoppedItems.isNotEmpty;
}
