import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/utils/math_double_utils.dart';

import 'grocery_item_store.dart';

part 'shopping_cart_store.g.dart';

class ShoppingCartStore = _ShoppingCartStore with _$ShoppingCartStore;

abstract class _ShoppingCartStore with Store {
  @observable
  ObservableList<CartItemStore> items = ObservableList.of([]);

  @computed
  bool get hasItems => items.isNotEmpty;

  @computed
  int get countItems => items.length;

  @action
  void addItem(CartItemStore cartItem) {
    final itemAlreadyExist =
        items.where((element) => element.item.id == cartItem.item.id).toList();

    if (itemAlreadyExist.isEmpty) {
      items.add(cartItem);
    } else {
      itemAlreadyExist.first.quantity = cartItem.quantity;
    }
  }

  @action
  void removeItem(CartItemStore cartItem) => items.remove(cartItem);
}

class CartItemStore = _CartItemStore with _$CartItemStore;

abstract class _CartItemStore with Store {
  _CartItemStore({required this.item, this.quantity = 1.0});

  @observable
  late GroceryItemStore item;

  @observable
  double quantity;

  @computed
  String get price {
    final priceDouble = item.unitPrice * quantity;
    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(priceDouble);
  }

  @action
  void setValue(double newValue) => quantity = roundDouble(newValue);

  @action
  void add() => quantity = roundDouble(quantity + 1);

  @action
  void remove() {
    if (quantity > 1) {
      quantity = roundDouble(quantity - 1);
    }
  }
}
