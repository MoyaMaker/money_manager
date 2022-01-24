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
      discount += item.discountQuantity;
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

  /// Displays discount container
  /// or any other detail in the cart item box
  @observable
  bool showDetails = false;

  /// Select promotion type
  @observable
  Promotions? promotion = Promotions.notSelected;

  /// Input discount
  @observable
  double? discount;

  @computed
  double get total {
    if (promotion!.showTextField && discount == null) {
      return subtotal;
    }

    switch (promotion) {
      case Promotions.percentage:
        final percentageDiscount = discount! / 100;

        final moneyDiscount = subtotal * percentageDiscount;

        return subtotal - moneyDiscount;
      case Promotions.quantity4UniquePrice:
        return discount!;
      case Promotions.points:
        return subtotal - discount!;
      // TODO: Check if this should add normal price when the quantity is over 2
      case Promotions.p2x1:
        return item.unitPrice;
      // TODO: Check if this should add normal price when the quantity is over 3
      case Promotions.p3x2:
        return item.unitPrice * 2;
      // TODO: Check if this should add normal price when the quantity is over 4
      case Promotions.p4x3:
        return item.unitPrice * 3;
      // TODO: Check if this should add normal price when the quantity is over 2
      case Promotions.q1x70percentage:
        final secondItem = item.unitPrice * 0.7;
        final secondItemPrice = item.unitPrice - secondItem;

        return item.unitPrice + secondItemPrice;
      // TODO: Check if this should add normal price when the quantity is over 2
      case Promotions.q1AndHalf:
        final secondItem = item.unitPrice * 0.5;
        final secondItemPrice = item.unitPrice - secondItem;

        return item.unitPrice + secondItemPrice;
      case Promotions.notSelected:
      default:
        return subtotal;
    }
  }

  @computed
  double get subtotal => item.unitPrice * quantity;

  @computed
  double get discountQuantity => subtotal - total;

  @computed
  String get subtotalFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(subtotal);

  @computed
  String get totalFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(total);

  @computed
  bool get basePriceWhenHasDiscount {
    if (promotion! != Promotions.notSelected &&
        promotion!.showTextField &&
        discount != null) {
      return true;
    } else if (promotion! != Promotions.notSelected &&
        !promotion!.showTextField) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void setQuantity(double newValue) => quantity = roundDouble(newValue);

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

  @action
  void removeDiscount() {
    promotion = Promotions.notSelected;
    discount = null;
  }
}

enum Promotions {
  notSelected,
  quantity4UniquePrice,
  percentage,
  points,
  p2x1,
  p3x2,
  p4x3,
  q1x70percentage,
  q1AndHalf
}

extension PromotionExtension on Promotions {
  String get value {
    switch (this) {
      case Promotions.points:
        return 'Pago con puntos';
      case Promotions.quantity4UniquePrice:
        return r'x$$';
      case Promotions.percentage:
        return '%';
      case Promotions.p2x1:
        return '2x1';
      case Promotions.p3x2:
        return '3x2';
      case Promotions.p4x3:
        return '4x3';
      case Promotions.q1x70percentage:
        return '1 y 70% precio';
      case Promotions.q1AndHalf:
        return '1 y 1/2 precio';
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
