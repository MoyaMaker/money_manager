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
  String toString() {
    return '''
item: ${item},
quantity: ${quantity},
price: ${price},
priceFormatted: ${priceFormatted}
    ''';
  }
}
