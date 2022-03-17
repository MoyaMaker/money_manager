// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_credit_card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateCreditCardStore on _CreateCreditCardStore, Store {
  final _$cardNameAtom = Atom(name: '_CreateCreditCardStore.cardName');

  @override
  String get cardName {
    _$cardNameAtom.reportRead();
    return super.cardName;
  }

  @override
  set cardName(String value) {
    _$cardNameAtom.reportWrite(value, super.cardName, () {
      super.cardName = value;
    });
  }

  final _$creditLimitAtom = Atom(name: '_CreateCreditCardStore.creditLimit');

  @override
  String get creditLimit {
    _$creditLimitAtom.reportRead();
    return super.creditLimit;
  }

  @override
  set creditLimit(String value) {
    _$creditLimitAtom.reportWrite(value, super.creditLimit, () {
      super.creditLimit = value;
    });
  }

  final _$dueDateAtom = Atom(name: '_CreateCreditCardStore.dueDate');

  @override
  String get dueDate {
    _$dueDateAtom.reportRead();
    return super.dueDate;
  }

  @override
  set dueDate(String value) {
    _$dueDateAtom.reportWrite(value, super.dueDate, () {
      super.dueDate = value;
    });
  }

  final _$paymentLimitDateAtom =
      Atom(name: '_CreateCreditCardStore.paymentLimitDate');

  @override
  String get paymentLimitDate {
    _$paymentLimitDateAtom.reportRead();
    return super.paymentLimitDate;
  }

  @override
  set paymentLimitDate(String value) {
    _$paymentLimitDateAtom.reportWrite(value, super.paymentLimitDate, () {
      super.paymentLimitDate = value;
    });
  }

  final _$_initBoxAsyncAction = AsyncAction('_CreateCreditCardStore._initBox');

  @override
  Future<void> _initBox() {
    return _$_initBoxAsyncAction.run(() => super._initBox());
  }

  final _$_CreateCreditCardStoreActionController =
      ActionController(name: '_CreateCreditCardStore');

  @override
  void setCardName(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.setCardName');
    try {
      return super.setCardName(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCreditLimit(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.setCreditLimit');
    try {
      return super.setCreditLimit(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDueDate(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.setDueDate');
    try {
      return super.setDueDate(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaymentLimitDate(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.setPaymentLimitDate');
    try {
      return super.setPaymentLimitDate(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCardName(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.validateCardName');
    try {
      return super.validateCardName(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCreditLimit(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.validateCreditLimit');
    try {
      return super.validateCreditLimit(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDueDate(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.validateDueDate');
    try {
      return super.validateDueDate(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePaymentLimitDate(String value) {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.validatePaymentLimitDate');
    try {
      return super.validatePaymentLimitDate(value);
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_CreateCreditCardStoreActionController.startAction(
        name: '_CreateCreditCardStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CreateCreditCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardName: ${cardName},
creditLimit: ${creditLimit},
dueDate: ${dueDate},
paymentLimitDate: ${paymentLimitDate}
    ''';
  }
}

mixin _$ErrorFormCreditCard on _ErrorFormCreditCard, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ErrorFormCreditCard.hasErrors'))
          .value;

  final _$cardNameAtom = Atom(name: '_ErrorFormCreditCard.cardName');

  @override
  String? get cardName {
    _$cardNameAtom.reportRead();
    return super.cardName;
  }

  @override
  set cardName(String? value) {
    _$cardNameAtom.reportWrite(value, super.cardName, () {
      super.cardName = value;
    });
  }

  final _$creditLimitAtom = Atom(name: '_ErrorFormCreditCard.creditLimit');

  @override
  String? get creditLimit {
    _$creditLimitAtom.reportRead();
    return super.creditLimit;
  }

  @override
  set creditLimit(String? value) {
    _$creditLimitAtom.reportWrite(value, super.creditLimit, () {
      super.creditLimit = value;
    });
  }

  final _$dueDateAtom = Atom(name: '_ErrorFormCreditCard.dueDate');

  @override
  String? get dueDate {
    _$dueDateAtom.reportRead();
    return super.dueDate;
  }

  @override
  set dueDate(String? value) {
    _$dueDateAtom.reportWrite(value, super.dueDate, () {
      super.dueDate = value;
    });
  }

  final _$paymentLimitDateAtom =
      Atom(name: '_ErrorFormCreditCard.paymentLimitDate');

  @override
  String? get paymentLimitDate {
    _$paymentLimitDateAtom.reportRead();
    return super.paymentLimitDate;
  }

  @override
  set paymentLimitDate(String? value) {
    _$paymentLimitDateAtom.reportWrite(value, super.paymentLimitDate, () {
      super.paymentLimitDate = value;
    });
  }

  @override
  String toString() {
    return '''
cardName: ${cardName},
creditLimit: ${creditLimit},
dueDate: ${dueDate},
paymentLimitDate: ${paymentLimitDate},
hasErrors: ${hasErrors}
    ''';
  }
}
