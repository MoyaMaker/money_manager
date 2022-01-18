// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroceryListStore on _GroceryListStore, Store {
  final _$itemsAtom = Atom(name: '_GroceryListStore.items');

  @override
  ObservableList<GroceryItemStore> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<GroceryItemStore> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_GroceryListStoreActionController =
      ActionController(name: '_GroceryListStore');

  @override
  void add(GroceryItemStore item) {
    final _$actionInfo = _$_GroceryListStoreActionController.startAction(
        name: '_GroceryListStore.add');
    try {
      return super.add(item);
    } finally {
      _$_GroceryListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(GroceryItemStore item) {
    final _$actionInfo = _$_GroceryListStoreActionController.startAction(
        name: '_GroceryListStore.remove');
    try {
      return super.remove(item);
    } finally {
      _$_GroceryListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}

mixin _$GroceryItemStore on _GroceryItemStore, Store {
  Computed<String>? _$unitPriceFormattedComputed;

  @override
  String get unitPriceFormatted => (_$unitPriceFormattedComputed ??=
          Computed<String>(() => super.unitPriceFormatted,
              name: '_GroceryItemStore.unitPriceFormatted'))
      .value;

  final _$idAtom = Atom(name: '_GroceryItemStore.id');

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

  final _$nameAtom = Atom(name: '_GroceryItemStore.name');

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

  final _$unitPriceAtom = Atom(name: '_GroceryItemStore.unitPrice');

  @override
  double get unitPrice {
    _$unitPriceAtom.reportRead();
    return super.unitPrice;
  }

  @override
  set unitPrice(double value) {
    _$unitPriceAtom.reportWrite(value, super.unitPrice, () {
      super.unitPrice = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
unitPrice: ${unitPrice},
unitPriceFormatted: ${unitPriceFormatted}
    ''';
  }
}
