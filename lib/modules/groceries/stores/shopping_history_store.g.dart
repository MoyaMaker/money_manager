// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingHistoryStore on _ShoppingHistoryStore, Store {
  Computed<int>? _$countItemsComputed;

  @override
  int get countItems =>
      (_$countItemsComputed ??= Computed<int>(() => super.countItems,
              name: '_ShoppingHistoryStore.countItems'))
          .value;
  Computed<bool>? _$hasItemsComputed;

  @override
  bool get hasItems =>
      (_$hasItemsComputed ??= Computed<bool>(() => super.hasItems,
              name: '_ShoppingHistoryStore.hasItems'))
          .value;

  final _$shoppedItemsAtom = Atom(name: '_ShoppingHistoryStore.shoppedItems');

  @override
  ObservableList<ShoppingCartStore> get shoppedItems {
    _$shoppedItemsAtom.reportRead();
    return super.shoppedItems;
  }

  @override
  set shoppedItems(ObservableList<ShoppingCartStore> value) {
    _$shoppedItemsAtom.reportWrite(value, super.shoppedItems, () {
      super.shoppedItems = value;
    });
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
