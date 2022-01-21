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

  @computed
  String get total {
    double subtotal = 0.0;

    for (var item in items) {
      subtotal += item.price;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  @action
  void addItem(CartItemStore cartItem) {
    final itemAlreadyExist =
        items.where((element) => element.item.id == cartItem.item.id).toList();

    if (itemAlreadyExist.isEmpty) {
      items.add(cartItem);
    } else {
      itemAlreadyExist.first.item.unitPrice = cartItem.item.unitPrice;
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

  @observable
  bool showDetails = false;

  @observable
  Promotions? promotion = Promotions.notSelected;

  @observable
  double? discount;

  @computed
  double get price {
    final _price = item.unitPrice * quantity;
    switch (promotion) {
      case Promotions.percentage:
        if (discount == null) return _price;

        final percentageDiscount = discount! / 100;

        final moneyDiscount = _price * percentageDiscount;

        return _price - moneyDiscount;
      case Promotions.quantity4UniquePrice:
        if (discount == null) return _price;
        return discount!;
      case Promotions.points:
        if (discount == null) return _price;
        return _price - discount!;
      case Promotions.notSelected:
      default:
        return _price;
    }
  }

  @computed
  String get basePriceFormatted {
    final _price = item.unitPrice * quantity;
    return NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(_price);
  }

  @computed
  String get priceFormatted {
    return NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(price);
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

  @action
  void setShowDetails(bool value) => showDetails = value;

  @action
  void setPromotion(Promotions? value) => promotion = value;

  @action
  void setDiscount(double? value) => discount = value;
}

enum Promotions { notSelected, quantity4UniquePrice, percentage, points }

extension PromotionExtension on Promotions {
  String get value {
    switch (this) {
      case Promotions.points:
        return 'Pago con puntos';
      case Promotions.quantity4UniquePrice:
        return r'x$$';
      case Promotions.percentage:
        return '%';
      case Promotions.notSelected:
      default:
        return 'No seleccionado';
    }
  }

  bool get showTextField {
    switch (this) {
      case Promotions.quantity4UniquePrice:
      case Promotions.percentage:
      case Promotions.points:
        return true;
      case Promotions.notSelected:
      default:
        return false;
    }
  }
}
