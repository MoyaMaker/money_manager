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
  Computed<bool>? _$hasValuesComputed;

  @override
  bool get hasValues =>
      (_$hasValuesComputed ??= Computed<bool>(() => super.hasValues,
              name: '_ShoppingHistoryStore.hasValues'))
          .value;

  final _$shopItemsAtom = Atom(name: '_ShoppingHistoryStore.shopItems');

  @override
  ObservableList<ShoppingCartStore> get shopItems {
    _$shopItemsAtom.reportRead();
    return super.shopItems;
  }

  @override
  set shopItems(ObservableList<ShoppingCartStore> value) {
    _$shopItemsAtom.reportWrite(value, super.shopItems, () {
      super.shopItems = value;
    });
  }

  @override
  String toString() {
    return '''
shopItems: ${shopItems},
countItems: ${countItems},
hasValues: ${hasValues}
    ''';
  }
}
