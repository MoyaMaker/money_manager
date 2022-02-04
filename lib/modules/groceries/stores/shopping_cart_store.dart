import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'cart_item_store.dart';

part 'shopping_cart_store.g.dart';

class ShoppingCartStore = _ShoppingCartStore with _$ShoppingCartStore;

abstract class _ShoppingCartStore with Store {
  _ShoppingCartStore(
      {this.id,
      ObservableList<CartItemStore>? items,
      this.storeName = '',
      DateTime? buyDate})
      : buyDate = buyDate ?? DateTime.now(),
        items = items ?? ObservableList<CartItemStore>.of([]);

  @observable
  String? id;

  @observable
  ObservableList<CartItemStore> items;

  @observable
  DateTime buyDate;

  @observable
  String storeName;

  @computed
  bool get hasItems => items.isNotEmpty;

  @computed
  int get countItems => items.length;

  @computed
  String get buyDateFormatted =>
      DateFormat('dd MMMM yyyy', 'es_MX').format(buyDate);

  @computed
  String get subtotal {
    double subtotal = 0.0;

    for (var item in items) {
      subtotal += item.subtotal;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  @computed
  String get discount {
    double discount = 0.0;

    for (var item in items) {
      discount += item.discountAmount;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(discount);
  }

  @computed
  String get total {
    double subtotal = 0.0;

    for (var item in items) {
      subtotal += item.total;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  @computed
  bool get canContinueBuy => hasItems && storeName.isNotEmpty;

  @action
  void addItem(CartItemStore cartItem) {
    final itemAlreadyExist = items
        .where((element) => element.product.id == cartItem.product.id)
        .toList();

    if (itemAlreadyExist.isEmpty) {
      items.add(cartItem);
    } else {
      itemAlreadyExist.first.product.unitPrice = cartItem.product.unitPrice;
      itemAlreadyExist.first.quantity = cartItem.quantity;
    }
  }

  @action
  void removeItem(CartItemStore cartItem) => items.remove(cartItem);

  @action
  void setBuyDate(DateTime value) => buyDate = value;

  @action
  void setStoreName(String value) => storeName = value;

  @action
  void cleanCart() {
    items = items = ObservableList.of([]);
    storeName = '';
    buyDate = DateTime.now();
  }
}
