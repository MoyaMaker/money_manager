// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductListStore on _ProductListStore, Store {
  Computed<List<ProductStore>>? _$filteredItemsComputed;

  @override
  List<ProductStore> get filteredItems => (_$filteredItemsComputed ??=
          Computed<List<ProductStore>>(() => super.filteredItems,
              name: '_ProductListStore.filteredItems'))
      .value;

  final _$itemsAtom = Atom(name: '_ProductListStore.items');

  @override
  ObservableList<ProductStore> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ProductStore> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$searchQueryAtom = Atom(name: '_ProductListStore.searchQuery');

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  final _$_ProductListStoreActionController =
      ActionController(name: '_ProductListStore');

  @override
  void add(ProductStore item) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.add');
    try {
      return super.add(item);
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(ProductStore item) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.remove');
    try {
      return super.remove(item);
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
searchQuery: ${searchQuery},
filteredItems: ${filteredItems}
    ''';
  }
}

mixin _$ProductStore on _ProductStore, Store {
  Computed<String>? _$unitPriceFormattedComputed;

  @override
  String get unitPriceFormatted => (_$unitPriceFormattedComputed ??=
          Computed<String>(() => super.unitPriceFormatted,
              name: '_ProductStore.unitPriceFormatted'))
      .value;

  final _$idAtom = Atom(name: '_ProductStore.id');

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

  final _$nameAtom = Atom(name: '_ProductStore.name');

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

  final _$unitPriceAtom = Atom(name: '_ProductStore.unitPrice');

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
