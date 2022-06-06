// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductHiveAdapter extends TypeAdapter<ProductStore> {
  @override
  final int typeId = 0;

  @override
  ProductStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductStore(
      id: fields[0] as String,
      name: fields[1] as String,
      unitPrice: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProductStore obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.unitPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductListStore on _ProductListStore, Store {
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_ProductListStore.showProgress'))
          .value;
  Computed<bool>? _$showFeedbackMessageComputed;

  @override
  bool get showFeedbackMessage => (_$showFeedbackMessageComputed ??=
          Computed<bool>(() => super.showFeedbackMessage,
              name: '_ProductListStore.showFeedbackMessage'))
      .value;
  Computed<List<ProductStore>>? _$filteredProductsComputed;

  @override
  List<ProductStore> get filteredProducts => (_$filteredProductsComputed ??=
          Computed<List<ProductStore>>(() => super.filteredProducts,
              name: '_ProductListStore.filteredProducts'))
      .value;

  late final _$feedbackMessageAtom =
      Atom(name: '_ProductListStore.feedbackMessage', context: context);

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

  late final _$productsAtom =
      Atom(name: '_ProductListStore.products', context: context);

  @override
  ObservableList<ProductStore> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductStore> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_ProductListStore.searchQuery', context: context);

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

  late final _$_initBoxAsyncAction =
      AsyncAction('_ProductListStore._initBox', context: context);

  @override
  Future<void> _initBox() {
    return _$_initBoxAsyncAction.run(() => super._initBox());
  }

  late final _$_ProductListStoreActionController =
      ActionController(name: '_ProductListStore', context: context);

  @override
  int findItemIndex(ProductStore product) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.findItemIndex');
    try {
      return super.findItemIndex(product);
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int findKeyInMap(ProductStore product) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.findKeyInMap');
    try {
      return super.findKeyInMap(product);
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ProductStore add(String name, double unitPrice) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.add');
    try {
      return super.add(name, unitPrice);
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void edit(ProductStore product) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.edit');
    try {
      return super.edit(product);
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(ProductStore product) {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.remove');
    try {
      return super.remove(product);
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
  void dispose() {
    final _$actionInfo = _$_ProductListStoreActionController.startAction(
        name: '_ProductListStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ProductListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feedbackMessage: ${feedbackMessage},
products: ${products},
searchQuery: ${searchQuery},
showProgress: ${showProgress},
showFeedbackMessage: ${showFeedbackMessage},
filteredProducts: ${filteredProducts}
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

  late final _$idAtom = Atom(name: '_ProductStore.id', context: context);

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

  late final _$nameAtom = Atom(name: '_ProductStore.name', context: context);

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
      Atom(name: '_ProductStore.unitPrice', context: context);

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
