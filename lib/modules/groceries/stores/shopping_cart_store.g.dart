// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCartStore on _ShoppingCartStore, Store {
  Computed<bool>? _$hasItemsComputed;

  @override
  bool get hasItems =>
      (_$hasItemsComputed ??= Computed<bool>(() => super.hasItems,
              name: '_ShoppingCartStore.hasItems'))
          .value;
  Computed<int>? _$countItemsComputed;

  @override
  int get countItems =>
      (_$countItemsComputed ??= Computed<int>(() => super.countItems,
              name: '_ShoppingCartStore.countItems'))
          .value;
  Computed<String>? _$totalComputed;

  @override
  String get total => (_$totalComputed ??=
          Computed<String>(() => super.total, name: '_ShoppingCartStore.total'))
      .value;

  final _$itemsAtom = Atom(name: '_ShoppingCartStore.items');

  @override
  ObservableList<CartItemStore> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<CartItemStore> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_ShoppingCartStoreActionController =
      ActionController(name: '_ShoppingCartStore');

  @override
  void addItem(CartItemStore cartItem) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.addItem');
    try {
      return super.addItem(cartItem);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(CartItemStore cartItem) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.removeItem');
    try {
      return super.removeItem(cartItem);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
hasItems: ${hasItems},
countItems: ${countItems},
total: ${total}
    ''';
  }
}

mixin _$CartItemStore on _CartItemStore, Store {
  Computed<double>? _$priceComputed;

  @override
  double get price => (_$priceComputed ??=
          Computed<double>(() => super.price, name: '_CartItemStore.price'))
      .value;
  Computed<String>? _$basePriceFormattedComputed;

  @override
  String get basePriceFormatted => (_$basePriceFormattedComputed ??=
          Computed<String>(() => super.basePriceFormatted,
              name: '_CartItemStore.basePriceFormatted'))
      .value;
  Computed<String>? _$priceFormattedComputed;

  @override
  String get priceFormatted =>
      (_$priceFormattedComputed ??= Computed<String>(() => super.priceFormatted,
              name: '_CartItemStore.priceFormatted'))
          .value;

  final _$itemAtom = Atom(name: '_CartItemStore.item');

  @override
  GroceryItemStore get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(GroceryItemStore value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
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
  void setValue(double newValue) {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add() {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.add');
    try {
      return super.add();
    } finally {
      _$_CartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo = _$_CartItemStoreActionController.startAction(
        name: '_CartItemStore.remove');
    try {
      return super.remove();
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
  String toString() {
    return '''
item: ${item},
quantity: ${quantity},
showDetails: ${showDetails},
promotion: ${promotion},
discount: ${discount},
price: ${price},
basePriceFormatted: ${basePriceFormatted},
priceFormatted: ${priceFormatted}
    ''';
  }
}
