// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartItemStore on _CartItemStore, Store {
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_CartItemStore.total'))
      .value;
  Computed<double>? _$subtotalComputed;

  @override
  double get subtotal =>
      (_$subtotalComputed ??= Computed<double>(() => super.subtotal,
              name: '_CartItemStore.subtotal'))
          .value;
  Computed<double>? _$discountAmountComputed;

  @override
  double get discountAmount =>
      (_$discountAmountComputed ??= Computed<double>(() => super.discountAmount,
              name: '_CartItemStore.discountAmount'))
          .value;
  Computed<String>? _$discountAmountFormattedComputed;

  @override
  String get discountAmountFormatted => (_$discountAmountFormattedComputed ??=
          Computed<String>(() => super.discountAmountFormatted,
              name: '_CartItemStore.discountAmountFormatted'))
      .value;
  Computed<String>? _$subtotalFormattedComputed;

  @override
  String get subtotalFormatted => (_$subtotalFormattedComputed ??=
          Computed<String>(() => super.subtotalFormatted,
              name: '_CartItemStore.subtotalFormatted'))
      .value;
  Computed<String>? _$totalFormattedComputed;

  @override
  String get totalFormatted =>
      (_$totalFormattedComputed ??= Computed<String>(() => super.totalFormatted,
              name: '_CartItemStore.totalFormatted'))
          .value;
  Computed<bool>? _$hasSomeDiscountComputed;

  @override
  bool get hasSomeDiscount =>
      (_$hasSomeDiscountComputed ??= Computed<bool>(() => super.hasSomeDiscount,
              name: '_CartItemStore.hasSomeDiscount'))
          .value;

  final _$productAtom = Atom(name: '_CartItemStore.product');

  @override
  ProductStore get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductStore value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$quantityAtom = Atom(name: '_CartItemStore.quantity');

  @override
  double get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(double value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$showDetailsAtom = Atom(name: '_CartItemStore.showDetails');

  @override
  bool get showDetails {
    _$showDetailsAtom.reportRead();
    return super.showDetails;
  }

  @override
  set showDetails(bool value) {
    _$showDetailsAtom.reportWrite(value, super.showDetails, () {
      super.showDetails = value;
    });
  }

  final _$promotionAtom = Atom(name: '_CartItemStore.promotion');

  @override
  Promotions? get promotion {
    _$promotionAtom.reportRead();
    return super.promotion;
  }

  @override
  set promotion(Promotions? value) {
    _$promotionAtom.reportWrite(value, super.promotion, () {
      super.promotion = value;
    });
  }

  final _$discountAtom = Atom(name: '_CartItemStore.discount');

  @override
  double? get discount {
    _$discountAtom.reportRead();
    return super.discount;
  }

  @override
  set discount(double? value) {
    _$discountAtom.reportWrite(value, super.discount, () {
      super.discount = value;
    });
  }

  final _$_CartItemStoreActionController =
      ActionController(name: '_CartItemStore');

  @override
  double _calculatePromotion(double q, double uPrice,
      {required int moduleQuantity,
      required double promo,
      bool applyModule = true}) {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore._calculatePromotion');
    try {
      return super._calculatePromotion(q, uPrice,
          moduleQuantity: moduleQuantity,
          promo: promo,
          applyModule: applyModule);
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(double newValue) {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.setQuantity');
    try {
      return super.setQuantity(newValue);
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowDetails(bool value) {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.setShowDetails');
    try {
      return super.setShowDetails(value);
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPromotion(Promotions? value) {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.setPromotion');
    try {
      return super.setPromotion(value);
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDiscount(double? value) {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.setDiscount');
    try {
      return super.setDiscount(value);
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeDiscount() {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.removeDiscount');
    try {
      return super.removeDiscount();
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
quantity: ${quantity},
showDetails: ${showDetails},
promotion: ${promotion},
discount: ${discount},
total: ${total},
subtotal: ${subtotal},
discountAmount: ${discountAmount},
discountAmountFormatted: ${discountAmountFormatted},
subtotalFormatted: ${subtotalFormatted},
totalFormatted: ${totalFormatted},
hasSomeDiscount: ${hasSomeDiscount}
    ''';
  }
}
