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

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreditCardListStore on _CreditCardListStore, Store {
  Computed<CreditCardStore>? _$activeCardComputed;

  @override
  CreditCardStore get activeCard => (_$activeCardComputed ??=
          Computed<CreditCardStore>(() => super.activeCard,
              name: '_CreditCardListStore.activeCard'))
      .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_CreditCardListStore.showProgress'))
          .value;

  late final _$activeIndexAtom =
      Atom(name: '_CreditCardListStore.activeIndex', context: context);

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
    });
  }

  late final _$feedbackMessageAtom =
      Atom(name: '_CreditCardListStore.feedbackMessage', context: context);

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

  late final _$creditCardListAtom =
      Atom(name: '_CreditCardListStore.creditCardList', context: context);

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

  late final _$_initBoxAsyncAction =
      AsyncAction('_CreditCardListStore._initBox', context: context);

  @override
  Future<void> _initBox() {
    return _$_initBoxAsyncAction.run(() => super._initBox());
  }

  late final _$addAsyncAction =
      AsyncAction('_CreditCardListStore.add', context: context);

  @override
  Future<void> add(CreditCardStore card) {
    return _$addAsyncAction.run(() => super.add(card));
  }

  late final _$_CreditCardListStoreActionController =
      ActionController(name: '_CreditCardListStore', context: context);

  @override
  void nextCard() {
    final _$actionInfo = _$_CreditCardListStoreActionController.startAction(
        name: '_CreditCardListStore.nextCard');
    try {
      return super.nextCard();
    } finally {
      _$_CreditCardListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prevCard() {
    final _$actionInfo = _$_CreditCardListStoreActionController.startAction(
        name: '_CreditCardListStore.prevCard');
    try {
      return super.prevCard();
    } finally {
      _$_CreditCardListStoreActionController.endAction(_$actionInfo);
    }
  }

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
activeIndex: ${activeIndex},
feedbackMessage: ${feedbackMessage},
creditCardList: ${creditCardList},
activeCard: ${activeCard},
showProgress: ${showProgress}
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

  late final _$idAtom = Atom(name: '_CreditCardStore.id', context: context);

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

  late final _$creditNameAtom =
      Atom(name: '_CreditCardStore.creditName', context: context);

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

  late final _$creditLimitAtom =
      Atom(name: '_CreditCardStore.creditLimit', context: context);

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

  late final _$dueDateAtom =
      Atom(name: '_CreditCardStore.dueDate', context: context);

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

  late final _$paymentLimitDateAtom =
      Atom(name: '_CreditCardStore.paymentLimitDate', context: context);

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
