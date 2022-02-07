// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

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

  final _$shoppedItemsAtom = Atom(name: '_ReceiptHistoryStore.shoppedItems');

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

  final _$_initBoxAsyncAction = AsyncAction('_ReceiptHistoryStore._initBox');

  @override
  Future<void> _initBox() {
    return _$_initBoxAsyncAction.run(() => super._initBox());
  }

  final _$_ReceiptHistoryStoreActionController =
      ActionController(name: '_ReceiptHistoryStore');

  @override
  void saveReceipt(ShoppingCartStore shoppingCart) {
    final _$actionInfo = _$_ReceiptHistoryStoreActionController.startAction(
        name: '_ReceiptHistoryStore.saveReceipt');
    try {
      return super.saveReceipt(shoppingCart);
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
