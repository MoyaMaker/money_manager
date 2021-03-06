// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormNewProduct on _FormNewProduct, Store {
  Computed<bool>? _$isNameCheckedPendingComputed;

  @override
  bool get isNameCheckedPending => (_$isNameCheckedPendingComputed ??=
          Computed<bool>(() => super.isNameCheckedPending,
              name: '_FormNewProduct.isNameCheckedPending'))
      .value;
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??=
          Computed<bool>(() => super.canSave, name: '_FormNewProduct.canSave'))
      .value;

  late final _$nameAtom = Atom(name: '_FormNewProduct.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$unitPriceAtom =
      Atom(name: '_FormNewProduct.unitPrice', context: context);

  @override
  String get unitPrice {
    _$unitPriceAtom.reportRead();
    return super.unitPrice;
  }

  @override
  set unitPrice(String value) {
    _$unitPriceAtom.reportWrite(value, super.unitPrice, () {
      super.unitPrice = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_FormNewProduct.quantity', context: context);

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

  late final _$nameCheckedAtom =
      Atom(name: '_FormNewProduct.nameChecked', context: context);

  @override
  ObservableFuture<bool> get nameChecked {
    _$nameCheckedAtom.reportRead();
    return super.nameChecked;
  }

  @override
  set nameChecked(ObservableFuture<bool> value) {
    _$nameCheckedAtom.reportWrite(value, super.nameChecked, () {
      super.nameChecked = value;
    });
  }

  late final _$checkNameExistAsyncAction =
      AsyncAction('_FormNewProduct.checkNameExist', context: context);

  @override
  Future<bool> checkNameExist(String value) {
    return _$checkNameExistAsyncAction.run(() => super.checkNameExist(value));
  }

  late final _$validateNameAsyncAction =
      AsyncAction('_FormNewProduct.validateName', context: context);

  @override
  Future<void> validateName(String value) {
    return _$validateNameAsyncAction.run(() => super.validateName(value));
  }

  late final _$_FormNewProductActionController =
      ActionController(name: '_FormNewProduct', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_FormNewProductActionController.startAction(
        name: '_FormNewProduct.setName');
    try {
      return super.setName(value);
    } finally {
      _$_FormNewProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnitPrice(String value) {
    final _$actionInfo = _$_FormNewProductActionController.startAction(
        name: '_FormNewProduct.setUnitPrice');
    try {
      return super.setUnitPrice(value);
    } finally {
      _$_FormNewProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String value) {
    final _$actionInfo = _$_FormNewProductActionController.startAction(
        name: '_FormNewProduct.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$_FormNewProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUnitPrice(String stringValue) {
    final _$actionInfo = _$_FormNewProductActionController.startAction(
        name: '_FormNewProduct.validateUnitPrice');
    try {
      return super.validateUnitPrice(stringValue);
    } finally {
      _$_FormNewProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateQuantity(String stringValue) {
    final _$actionInfo = _$_FormNewProductActionController.startAction(
        name: '_FormNewProduct.validateQuantity');
    try {
      return super.validateQuantity(stringValue);
    } finally {
      _$_FormNewProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo = _$_FormNewProductActionController.startAction(
        name: '_FormNewProduct.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_FormNewProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_FormNewProductActionController.startAction(
        name: '_FormNewProduct.dispose');
    try {
      return super.dispose();
    } finally {
      _$_FormNewProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
unitPrice: ${unitPrice},
quantity: ${quantity},
nameChecked: ${nameChecked},
isNameCheckedPending: ${isNameCheckedPending},
canSave: ${canSave}
    ''';
  }
}

mixin _$ErrorProductFormState on _ErrorProductFormState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ErrorProductFormState.hasErrors'))
          .value;

  late final _$nameAtom =
      Atom(name: '_ErrorProductFormState.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$unitPriceAtom =
      Atom(name: '_ErrorProductFormState.unitPrice', context: context);

  @override
  String? get unitPrice {
    _$unitPriceAtom.reportRead();
    return super.unitPrice;
  }

  @override
  set unitPrice(String? value) {
    _$unitPriceAtom.reportWrite(value, super.unitPrice, () {
      super.unitPrice = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_ErrorProductFormState.quantity', context: context);

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
name: ${name},
unitPrice: ${unitPrice},
quantity: ${quantity},
hasErrors: ${hasErrors}
    ''';
  }
}
