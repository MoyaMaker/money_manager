// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

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
  Computed<String>? _$buyDateFormattedComputed;

  @override
  String get buyDateFormatted => (_$buyDateFormattedComputed ??=
          Computed<String>(() => super.buyDateFormatted,
              name: '_ShoppingCartStore.buyDateFormatted'))
      .value;
  Computed<List<CartItemStore>>? _$checkedItemsComputed;

  @override
  List<CartItemStore> get checkedItems => (_$checkedItemsComputed ??=
          Computed<List<CartItemStore>>(() => super.checkedItems,
              name: '_ShoppingCartStore.checkedItems'))
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
  Computed<bool>? _$canCheckoutComputed;

  @override
  bool get canCheckout =>
      (_$canCheckoutComputed ??= Computed<bool>(() => super.canCheckout,
              name: '_ShoppingCartStore.canCheckout'))
          .value;

  late final _$idAtom = Atom(name: '_ShoppingCartStore.id', context: context);

  @override
  String? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$cartItemsAtom =
      Atom(name: '_ShoppingCartStore.cartItems', context: context);

  @override
  ObservableList<CartItemStore> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableList<CartItemStore> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$buyDateAtom =
      Atom(name: '_ShoppingCartStore.buyDate', context: context);

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

  late final _$storeNameAtom =
      Atom(name: '_ShoppingCartStore.storeName', context: context);

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

  late final _$selectAllAtom =
      Atom(name: '_ShoppingCartStore.selectAll', context: context);

  @override
  bool get selectAll {
    _$selectAllAtom.reportRead();
    return super.selectAll;
  }

  @override
  set selectAll(bool value) {
    _$selectAllAtom.reportWrite(value, super.selectAll, () {
      super.selectAll = value;
    });
  }

  late final _$_ShoppingCartStoreActionController =
      ActionController(name: '_ShoppingCartStore', context: context);

  @override
  void reorderItem(int oldIndex, int newIndex) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.reorderItem');
    try {
      return super.reorderItem(oldIndex, newIndex);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setId() {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.setId');
    try {
      return super.setId();
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int findItemIndex(CartItemStore cartItem) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.findItemIndex');
    try {
      return super.findItemIndex(cartItem);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int findKeyInMap(CartItemStore cartItem) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.findKeyInMap');
    try {
      return super.findKeyInMap(cartItem);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectAll(bool? value) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.setSelectAll');
    try {
      return super.setSelectAll(value);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void editItem(int index, CartItemStore cartItem) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.editItem');
    try {
      return super.editItem(index, cartItem);
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
  bool? thisItemIsChecked(CartItemStore item) {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.thisItemIsChecked');
    try {
      return super.thisItemIsChecked(item);
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePositionIndex() {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.updatePositionIndex');
    try {
      return super.updatePositionIndex();
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAllItemsInHive() {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.updateAllItemsInHive');
    try {
      return super.updateAllItemsInHive();
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ShoppingCartStoreActionController.startAction(
        name: '_ShoppingCartStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ShoppingCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
cartItems: ${cartItems},
buyDate: ${buyDate},
storeName: ${storeName},
selectAll: ${selectAll},
hasItems: ${hasItems},
countItems: ${countItems},
buyDateFormatted: ${buyDateFormatted},
checkedItems: ${checkedItems},
subtotal: ${subtotal},
discount: ${discount},
total: ${total},
canContinueBuy: ${canContinueBuy},
canCheckout: ${canCheckout}
    ''';
  }
}
