import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cart_item_store.dart';

part 'shopping_cart_store.g.dart';

class ShoppingCartStore = _ShoppingCartStore with _$ShoppingCartStore;

abstract class _ShoppingCartStore with Store {
  _ShoppingCartStore(
      {this.id,
      ObservableList<CartItemStore>? items,
      this.storeName = '',
      DateTime? buyDate})
      : buyDate = buyDate ?? DateTime.now(),
        cartItems = items ?? ObservableList.of([]) {
    _disposers = [
      autorun((_) async {
        await _initBox();

        // Init values in list
        final cartItemsList = _box.values.toList();

        cartItems = ObservableList.of(cartItemsList);
      })
    ];
  }

  late Box<CartItemStore> _box;

  late List<ReactionDisposer> _disposers;

  @observable
  String? id;

  @observable
  late ObservableList<CartItemStore> cartItems;

  @observable
  DateTime buyDate;

  @observable
  String storeName;

  @computed
  bool get hasItems => cartItems.isNotEmpty;

  @computed
  int get countItems => cartItems.length;

  @computed
  String get buyDateFormatted =>
      DateFormat('dd MMMM yyyy', 'es_MX').format(buyDate);

  @computed
  String get subtotal {
    double subtotal = 0.0;

    for (var item in cartItems) {
      subtotal += item.subtotal;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  @computed
  String get discount {
    double discount = 0.0;

    for (var item in cartItems) {
      discount += item.discountAmount;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(discount);
  }

  @computed
  String get total {
    double subtotal = 0.0;

    for (var item in cartItems) {
      subtotal += item.total;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  @computed
  bool get canContinueBuy => hasItems && storeName.isNotEmpty;

  @action
  void addItem(CartItemStore cartItem) {
    final itemAlreadyExist = cartItems
        .where((element) => element.product.id == cartItem.product.id)
        .toList();

    if (itemAlreadyExist.isEmpty) {
      cartItems.add(cartItem);
      // Save in hive
      addToCart(cartItem);
    } else {
      final indexForEdit = cartItems.indexOf(itemAlreadyExist.first);

      editQuantity(indexForEdit, cartItem);
      itemAlreadyExist.first.product.unitPrice = cartItem.product.unitPrice;
      itemAlreadyExist.first.quantity = cartItem.quantity;
    }
  }

  @action
  void removeItem(int index, CartItemStore cartItem) {
    cartItems.remove(cartItem);

    removeFromCart(index);
  }

  @action
  void setBuyDate(DateTime value) => buyDate = value;

  @action
  void setStoreName(String value) => storeName = value;

  @action
  void cleanCart() {
    cartItems = ObservableList.of([]);
    storeName = '';
    buyDate = DateTime.now();
  }

  @action
  Future<void> _initBox() async {
    const boxName = 'shopping_cart';
    if (Hive.isBoxOpen(boxName)) {
      _box = Hive.box<CartItemStore>(boxName);
    } else {
      _box = await Hive.openBox<CartItemStore>(boxName);
    }
  }

  Future<int> addToCart(CartItemStore cartItem) {
    return _box.add(cartItem);
  }

  Future<void> removeFromCart(int index) {
    return _box.deleteAt(index);
  }

  Future<void> editQuantity(int index, CartItemStore cartItem) {
    return _box.putAt(index, cartItem);
  }

  void _disposeBox() {
    _box.close();
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    _disposeBox();
  }
}
