// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_cart_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormCartItemStore on _FormCartItemStore, Store {
  late final _$priceAtom =
      Atom(name: '_FormCartItemStore.price', context: context);

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_FormCartItemStore.quantity', context: context);

  @override
  String get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(String value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$_FormCartItemStoreActionController =
      ActionController(name: '_FormCartItemStore', context: context);

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_FormCartItemStoreActionController.startAction(
        name: '_FormCartItemStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_FormCartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String value) {
    final _$actionInfo = _$_FormCartItemStoreActionController.startAction(
        name: '_FormCartItemStore.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$_FormCartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePrice(String value) {
    final _$actionInfo = _$_FormCartItemStoreActionController.startAction(
        name: '_FormCartItemStore.validatePrice');
    try {
      return super.validatePrice(value);
    } finally {
      _$_FormCartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateQuantity(String value) {
    final _$actionInfo = _$_FormCartItemStoreActionController.startAction(
        name: '_FormCartItemStore.validateQuantity');
    try {
      return super.validateQuantity(value);
    } finally {
      _$_FormCartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_FormCartItemStoreActionController.startAction(
        name: '_FormCartItemStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_FormCartItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
price: ${price},
quantity: ${quantity}
    ''';
  }
}

mixin _$ErrorFormCartItemStore on _ErrorFormCartItemStore, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ErrorFormCartItemStore.hasErrors'))
          .value;

  late final _$priceAtom =
      Atom(name: '_ErrorFormCartItemStore.price', context: context);

  @override
  String? get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String? value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_ErrorFormCartItemStore.quantity', context: context);

  @override
  String? get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(String? value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  @override
  String toString() {
    return '''
price: ${price},
quantity: ${quantity},
hasErrors: ${hasErrors}
    ''';
  }
}
