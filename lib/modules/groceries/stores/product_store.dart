import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import 'package:money_manager/modules/groceries/providers/products_collection.dart';

part 'product_store.g.dart';

class ProductListStore extends _ProductListStore with _$ProductListStore {}

abstract class _ProductListStore with Store {
  _ProductListStore() {
    // Set reactions
    _disposers = [
      autorun((_) async {
        // Init values in list
        final productList = _productsCollection.values.toList();

        if (productList.isEmpty) {
          feedbackMessage = 'No hay productos registrados';
        }

        products = ObservableList.of(productList);
      }),
      reaction((_) => searchQuery, (String q) {
        if (q.isNotEmpty && filteredProducts.isEmpty) {
          feedbackMessage = 'No hay coincidencias';
        } else {
          feedbackMessage = 'No hay productos registrados';
        }
      })
    ];
  }

  final _productsCollection = ProductsCollection();

  late List<ReactionDisposer> _disposers;

  @observable
  String feedbackMessage = '';

  @observable
  ObservableList<ProductStore> products = ObservableList.of([]);

  @observable
  String searchQuery = '';

  @computed
  bool get showProgress =>
      searchQuery.isEmpty && products.isEmpty && feedbackMessage.isEmpty;

  @computed
  bool get showFeedbackMessage =>
      filteredProducts.isEmpty && feedbackMessage.isNotEmpty;

  @computed
  List<ProductStore> get filteredProducts {
    if (searchQuery.isEmpty) return products;

    return products
        .where((element) =>
            element.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @action
  int findItemIndex(ProductStore product) {
    return products.indexWhere((element) => element.id == product.id);
  }

  @action
  int findKeyInMap(ProductStore product) {
    final mapProducts = _productsCollection.toMap().cast<int, ProductStore>();

    int resultKey = -1;

    mapProducts.forEach((key, value) {
      if (value.id == product.id) {
        resultKey = key;
      }
    });

    return resultKey;
  }

  @action
  ProductStore add(String name, double unitPrice) {
    final newProduct =
        ProductStore(id: const Uuid().v1(), name: name, unitPrice: unitPrice);

    products.add(newProduct);

    // Save in local data
    _productsCollection.add(newProduct);

    return newProduct;
  }

  @action
  void edit(ProductStore product) {
    final key = findKeyInMap(product);

    final itemIndex = findItemIndex(product);

    products[itemIndex] = product;

    // Edit in saved data
    _productsCollection.edit(key, product);
  }

  @action
  void remove(ProductStore product) {
    final key = findKeyInMap(product);

    products.remove(product);

    _productsCollection.delete(key);
  }

  @action
  void setSearchQuery(String value) => searchQuery = value;

  /// ## Restore product list
  /// Restore product list and validate if item already exist
  ///
  /// Return list of items added
  @action
  Future<Iterable<int>> restoreProducts(List<ProductStore> values) async {
    List<int> itemsAdded = [];

    for (var product in values) {
      final index = findItemIndex(product);
      if (index == -1) {
        products.add(product);
        final numberKey = await _productsCollection.add(product);
        itemsAdded.add(numberKey);
      }
    }

    return itemsAdded;
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}

@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'ProductHiveAdapter')
class ProductStore extends _ProductStore with _$ProductStore {
  ProductStore(
      {required String id, required String name, required double unitPrice})
      : super(id: id, name: name, unitPrice: unitPrice);

  factory ProductStore.fromJson(Map<String, dynamic> json) =>
      _$ProductStoreFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStoreToJson(this);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

abstract class _ProductStore with Store {
  _ProductStore(
      {required this.id, required this.name, required this.unitPrice});

  @HiveField(0)
  @observable
  String id;

  @HiveField(1)
  @observable
  String name;

  @HiveField(2)
  @observable
  double unitPrice;

  @computed
  String get unitPriceFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(unitPrice);
}
