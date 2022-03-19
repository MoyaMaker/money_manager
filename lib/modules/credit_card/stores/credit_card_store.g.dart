// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardAdapter extends TypeAdapter<CreditCardStore> {
  @override
  final int typeId = 4;

  @override
  CreditCardStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCardStore(
      id: fields[0] as String,
      creditName: fields[1] as String,
      creditLimit: fields[2] as double,
      dueDate: fields[3] as int,
      paymentLimitDate: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardStore obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creditName)
      ..writeByte(2)
      ..write(obj.creditLimit)
      ..writeByte(3)
      ..write(obj.dueDate)
      ..writeByte(4)
      ..write(obj.paymentLimitDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardListStore on _CreditCardListStore, Store {
  final _$feedbackMessageAtom =
      Atom(name: '_CreditCardListStore.feedbackMessage');

  @override
  String get feedbackMessage {
    _$feedbackMessageAtom.reportRead();
    return super.feedbackMessage;
  }

  @override
  set feedbackMessage(String value) {
    _$feedbackMessageAtom.reportWrite(value, super.feedbackMessage, () {
      super.feedbackMessage = value;
    });
  }

  final _$creditCardListAtom =
      Atom(name: '_CreditCardListStore.creditCardList');

  @override
  ObservableList<CreditCardStore> get creditCardList {
    _$creditCardListAtom.reportRead();
    return super.creditCardList;
  }

  @override
  set creditCardList(ObservableList<CreditCardStore> value) {
    _$creditCardListAtom.reportWrite(value, super.creditCardList, () {
      super.creditCardList = value;
    });
  }

  final _$_initBoxAsyncAction = AsyncAction('_CreditCardListStore._initBox');

  @override
  Future<void> _initBox() {
    return _$_initBoxAsyncAction.run(() => super._initBox());
  }

  final _$addAsyncAction = AsyncAction('_CreditCardListStore.add');

  @override
  Future<void> add(CreditCardStore card) {
    return _$addAsyncAction.run(() => super.add(card));
  }

  final _$_CreditCardListStoreActionController =
      ActionController(name: '_CreditCardListStore');

  @override
  void _getCards() {
    final _$actionInfo = _$_CreditCardListStoreActionController.startAction(
        name: '_CreditCardListStore._getCards');
    try {
      return super._getCards();
    } finally {
      _$_CreditCardListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_CreditCardListStoreActionController.startAction(
        name: '_CreditCardListStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CreditCardListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feedbackMessage: ${feedbackMessage},
creditCardList: ${creditCardList}
    ''';
  }
}

mixin _$CreditCardStore on _CreditCardStore, Store {
  Computed<String>? _$creditLimitFormattedComputed;

  @override
  String get creditLimitFormatted => (_$creditLimitFormattedComputed ??=
          Computed<String>(() => super.creditLimitFormatted,
              name: '_CreditCardStore.creditLimitFormatted'))
      .value;

  final _$idAtom = Atom(name: '_CreditCardStore.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$creditNameAtom = Atom(name: '_CreditCardStore.creditName');

  @override
  String get creditName {
    _$creditNameAtom.reportRead();
    return super.creditName;
  }

  @override
  set creditName(String value) {
    _$creditNameAtom.reportWrite(value, super.creditName, () {
      super.creditName = value;
    });
  }

  final _$creditLimitAtom = Atom(name: '_CreditCardStore.creditLimit');

  @override
  double get creditLimit {
    _$creditLimitAtom.reportRead();
    return super.creditLimit;
  }

  @override
  set creditLimit(double value) {
    _$creditLimitAtom.reportWrite(value, super.creditLimit, () {
      super.creditLimit = value;
    });
  }

  final _$dueDateAtom = Atom(name: '_CreditCardStore.dueDate');

  @override
  int get dueDate {
    _$dueDateAtom.reportRead();
    return super.dueDate;
  }

  @override
  set dueDate(int value) {
    _$dueDateAtom.reportWrite(value, super.dueDate, () {
      super.dueDate = value;
    });
  }

  final _$paymentLimitDateAtom =
      Atom(name: '_CreditCardStore.paymentLimitDate');

  @override
  int get paymentLimitDate {
    _$paymentLimitDateAtom.reportRead();
    return super.paymentLimitDate;
  }

  @override
  set paymentLimitDate(int value) {
    _$paymentLimitDateAtom.reportWrite(value, super.paymentLimitDate, () {
      super.paymentLimitDate = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
creditName: ${creditName},
creditLimit: ${creditLimit},
dueDate: ${dueDate},
paymentLimitDate: ${paymentLimitDate},
creditLimitFormatted: ${creditLimitFormatted}
    ''';
  }
}
