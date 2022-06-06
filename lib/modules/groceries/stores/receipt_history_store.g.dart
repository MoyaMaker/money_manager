// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReceiptHistoryStore on _ReceiptHistoryStore, Store {
  Computed<int>? _$countItemsComputed;

  @override
  int get countItems =>
      (_$countItemsComputed ??= Computed<int>(() => super.countItems,
              name: '_ReceiptHistoryStore.countItems'))
          .value;
  Computed<bool>? _$hasItemsComputed;

  @override
  bool get hasItems =>
      (_$hasItemsComputed ??= Computed<bool>(() => super.hasItems,
              name: '_ReceiptHistoryStore.hasItems'))
          .value;

  late final _$shoppedItemsAtom =
      Atom(name: '_ReceiptHistoryStore.shoppedItems', context: context);

  @override
  ObservableList<Receipt> get shoppedItems {
    _$shoppedItemsAtom.reportRead();
    return super.shoppedItems;
  }

  @override
  set shoppedItems(ObservableList<Receipt> value) {
    _$shoppedItemsAtom.reportWrite(value, super.shoppedItems, () {
      super.shoppedItems = value;
    });
  }

  late final _$_initBoxAsyncAction =
      AsyncAction('_ReceiptHistoryStore._initBox', context: context);

  @override
  Future<void> _initBox() {
    return _$_initBoxAsyncAction.run(() => super._initBox());
  }

  late final _$_ReceiptHistoryStoreActionController =
      ActionController(name: '_ReceiptHistoryStore', context: context);

  @override
  void saveReceipt(String id, String storeName, DateTime buyDate,
      List<CartItemStore> cartItems) {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.saveReceipt');
    try {
      return super.saveReceipt(id, storeName, buyDate, cartItems);
    } finally {
      _$_ReceiptHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<int> saveIntoBox(Receipt receipt) {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.saveIntoBox');
    try {
      return super.saveIntoBox(receipt);
    } finally {
      _$_ReceiptHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(Receipt receipt) {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.delete');
    try {
      return super.delete(receipt);
    } finally {
      _$_ReceiptHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int findItemIndex(Receipt receipt) {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.findItemIndex');
    try {
      return super.findItemIndex(receipt);
    } finally {
      _$_ReceiptHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int findKeyInMap(Receipt receipt) {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.findKeyInMap');
    try {
      return super.findKeyInMap(receipt);
    } finally {
      _$_ReceiptHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> closeBox() {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.closeBox');
    try {
      return super.closeBox();
    } finally {
      _$_ReceiptHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ReceiptHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shoppedItems: ${shoppedItems},
countItems: ${countItems},
hasItems: ${hasItems}
    ''';
  }
}
