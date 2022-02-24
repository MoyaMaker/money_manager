import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'package:money_manager/utils/math_double_util.dart';
import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';

import 'product_store.dart';

part 'cart_item_store.g.dart';

@HiveType(typeId: 1, adapterName: 'CartItemAdapter')
class CartItemStore = _CartItemStore with _$CartItemStore;

abstract class _CartItemStore with Store {
  _CartItemStore(
      {required this.product,
      this.quantity = 1.0,
      this.promotion = Promotions.notSelected,
      this.discount});

  @HiveField(0)
  @observable
  late ProductStore product;

  @HiveField(1)
  @observable
  double quantity;

  /// Displays discount container
  /// or any other detail in the cart item box
  @observable
  bool showDetails = false;

  /// Select promotion type
  @HiveField(2)
  @observable
  Promotions? promotion;

  /// Input discount
  @HiveField(3)
  @observable
  double? discount;

  @observable
  bool hasChecked = false;

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
      case Promotions.p2x1:
        return _calculatePromotion(quantity, product.unitPrice,
            moduleQuantity: 2, promo: 0.5);
      case Promotions.p3x2:
        return _calculatePromotion(quantity, product.unitPrice,
            moduleQuantity: 3, promo: 0.3333);
      case Promotions.p4x3:
        return _calculatePromotion(quantity, product.unitPrice,
            moduleQuantity: 4, promo: 0.25);
      case Promotions.q1x70percentage:
        return _calculatePromotion(quantity, product.unitPrice,
            moduleQuantity: 1, promo: 0.7, applyModule: false);
      case Promotions.q1AndHalf:
        return _calculatePromotion(quantity, product.unitPrice,
            moduleQuantity: 1, promo: 0.5, applyModule: false);
      case Promotions.notSelected:
      default:
        return subtotal;
    }
  }

  @computed
  double get subtotal => product.unitPrice * quantity;

  @computed
  double get discountAmount =>
      double.parse((subtotal - total).toStringAsFixed(2));

  @computed
  String get discountAmountFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$')
          .format(subtotal - total);

  @computed
  String get subtotalFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(subtotal);

  @computed
  String get totalFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(total);

  @computed
  bool get hasSomeDiscount {
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
  double _calculatePromotion(double q, double uPrice,
      {required int moduleQuantity,
      required double promo,
      bool applyModule = true}) {
    final itemsWithoutPromo = applyModule ? q % moduleQuantity : moduleQuantity;
    final itemPromoApply = q - itemsWithoutPromo;

    final discount =
        double.parse(((itemPromoApply * uPrice) * promo).toStringAsFixed(2));

    final subtotal = q * uPrice;

    final total = subtotal - discount;

    return total;
  }

  @action
  void setHasChecked(bool? value) => hasChecked = value!;

  @action
  void setQuantity(double newValue) => quantity = roundDouble(newValue);

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
