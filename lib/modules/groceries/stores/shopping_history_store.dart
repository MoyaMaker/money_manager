import 'package:mobx/mobx.dart';

import 'grocery_item_store.dart';
import 'cart_item_store.dart';
import 'shopping_cart_store.dart';

part 'shopping_history_store.g.dart';

class ShoppingHistoryStore = _ShoppingHistoryStore with _$ShoppingHistoryStore;

abstract class _ShoppingHistoryStore with Store {
  @observable
  ObservableList<ShoppingCartStore> shopItems = ObservableList.of([
    ShoppingCartStore(
        id: '1',
        buyDate: DateTime.now(),
        storeName: 'Soriana',
        items: ObservableList<CartItemStore>.of([
          CartItemStore(
              item: GroceryItemStore(id: '0', name: 'Cereal', unitPrice: 56.0),
              quantity: 2.0,
              promotion: Promotions.p2x1),
          CartItemStore(
              item: GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
              quantity: 1.0),
          CartItemStore(
              item:
                  GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5),
              quantity: 1.0),
          CartItemStore(
              item: GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0),
              quantity: 1.0),
          CartItemStore(
              item: GroceryItemStore(id: '4', name: 'Cereal', unitPrice: 65.0),
              quantity: 1.0),
        ]))
  ]);

  @computed
  int get countItems => shopItems.length;

  @computed
  bool get hasValues => shopItems.isNotEmpty;
}
