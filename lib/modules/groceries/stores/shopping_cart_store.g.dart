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
  Computed<String>? _$subtotalComputed;

  @override
  String get subtotal =>
      (_$subtotalComputed ??= Computed<String>(() => super.subtotal,
              name: '_ShoppingCartStore.subtotal'))
          .value;
  Computed<String>? _$discountComputed;

  @override
  String get discount =>
      (_$discountComputed ??= Computed<String>(() => super.discount,
              name: '_ShoppingCartStore.discount'))
          .value;
  Computed<String>? _$totalComputed;

  @override
  String get total => (_$totalComputed ??=
          Computed<String>(() => super.total, name: '_ShoppingCartStore.total'))
      .value;
  Computed<bool>? _$canContinueBuyComputed;

  @override
  bool get canContinueBuy =>
      (_$canContinueBuyComputed ??= Computed<bool>(() => super.canContinueBuy,
              name: '_ShoppingCartStore.canContinueBuy'))
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

  final _$buyDateAtom = Atom(name: '_ShoppingCartStore.buyDate');

  @override
  DateTime get buyDate {
    _$buyDateAtom.reportRead();
    return super.buyDate;
  }

  @override
  set buyDate(DateTime value) {
    _$buyDateAtom.reportWrite(value, super.buyDate, () {
      super.buyDate = value;
    });
  }

  final _$storeNameAtom = Atom(name: '_ShoppingCartStore.storeName');

  @override
  String get storeName {
    _$storeNameAtom.reportRead();
    return super.storeName;
  }

  @override
  set storeName(String value) {
    _$storeNameAtom.reportWrite(value, super.storeName, () {
      super.storeName = value;
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
  void setBuyDate(DateTime value) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.setBuyDate');
    try {
      return super.setBuyDate(value);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStoreName(String value) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.setStoreName');
    try {
      return super.setStoreName(value);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanCart() {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.cleanCart');
    try {
      return super.cleanCart();
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
buyDate: ${buyDate},
storeName: ${storeName},
hasItems: ${hasItems},
countItems: ${countItems},
subtotal: ${subtotal},
discount: ${discount},
total: ${total},
canContinueBuy: ${canContinueBuy}
    ''';
  }
}
