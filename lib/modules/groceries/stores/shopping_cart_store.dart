import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'cart_item_store.dart';

part 'shopping_cart_store.g.dart';

class ShoppingCartStore = _ShoppingCartStore with _$ShoppingCartStore;

abstract class _ShoppingCartStore with Store {
  _ShoppingCartStore(
      {this.id,
      ObservableList<CartItemStore>? items,
      ObservableMap<int, CartItemStore>? itemsMap,
      this.storeName = '',
      DateTime? buyDate})
      : buyDate = buyDate ?? DateTime.now(),
        mapCartItems = itemsMap ?? ObservableMap.of({}),
        cartItems = items ?? ObservableList.of([]) {
    _disposers = [
      autorun((_) async {
        await _initBox();

        // Init values in list
        cartItems = ObservableList.of(_box.values.toList());

        mapCartItems =
            ObservableMap.of(_box.toMap().cast<int, CartItemStore>());
      }),
      reaction((_) => selectAll, (bool selected) {
        for (var item in cartItems) {
          item.setHasChecked(selected);
        }
      }),
      reaction((_) => checkedItems.length, (length) {
        final copyList = cartItems;
        copyList.sort(((a, b) => a.hasChecked ? 1 : -1));

        cartItems = ObservableList.of(copyList);
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
  late ObservableMap<int, CartItemStore> mapCartItems;

  @observable
  DateTime buyDate;

  @observable
  String storeName;

  @observable
  bool selectAll = false;

  @computed
  bool get hasItems => cartItems.isNotEmpty;

  @computed
  int get countItems => cartItems.length;

  @computed
  String get buyDateFormatted =>
      DateFormat('dd MMMM yyyy', 'es_MX').format(buyDate);

  @computed
  List<CartItemStore> get checkedItems =>
      cartItems.where((element) => element.hasChecked).toList();

  @computed
  String get subtotal {
    double subtotal = 0.0;

    for (var item in checkedItems) {
      subtotal += item.subtotal;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  @computed
  String get discount {
    double discount = 0.0;

    for (var item in checkedItems) {
      discount += item.discountAmount;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(discount);
  }

  @computed
  String get total {
    double subtotal = 0.0;

    for (var item in checkedItems) {
      subtotal += item.total;
    }

    return NumberFormat.currency(locale: 'es_MX', symbol: r'$')
        .format(subtotal);
  }

  @computed
  bool get canContinueBuy => hasItems && storeName.isNotEmpty;

  @action
  void setId() => id = const Uuid().v1();

  @action
  int findItemIndex(CartItemStore cartItem) {
    return cartItems
        .indexWhere((element) => element.product.id == cartItem.product.id);
  }

  @action
  void setSelectAll(bool? value) => selectAll = value!;

  @action
  void addItem(CartItemStore cartItem) {
    final indexItem = findItemIndex(cartItem);

    if (indexItem == -1) {
      cartItems.add(cartItem);
      // Save in hive
      saveIntoBox(cartItem);
    } else {
      final oldItem = cartItems[indexItem];

      // Sum new quantity
      cartItems[indexItem].quantity = oldItem.quantity + cartItem.quantity;
      // Update unit price
      cartItems[indexItem].product.unitPrice = cartItem.product.unitPrice;

      editFromBox(indexItem, cartItems[indexItem]);
    }
  }

  @action
  void editItem(int index, CartItemStore cartItem) {
    editFromBox(index, cartItem);
    cartItems[index].quantity = cartItem.quantity;
    cartItems[index].product.unitPrice = cartItem.product.unitPrice;
  }

  @action
  void removeItem(int index, CartItemStore cartItem) {
    cartItems.remove(cartItem);

    removeFromBox(index);
  }

  @action
  void setBuyDate(DateTime value) => buyDate = value;

  @action
  void setStoreName(String value) => storeName = value;

  @action
  void cleanCart() {
    id = null;
    storeName = '';
    buyDate = DateTime.now();
    cartItems = ObservableList.of([]);
    cleanBox();
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

  Future<int> saveIntoBox(CartItemStore cartItem) => _box.add(cartItem);

  Future<void> removeFromBox(int index) => _box.deleteAt(index);

  Future<void> editFromBox(int index, CartItemStore cartItem) =>
      _box.putAt(index, cartItem);

  Future<void> cleanBox() => _box.clear();

  Future<void> _disposeBox() => _box.close();

  @action
  void dispose() {
    _disposeBox();
    for (var d in _disposers) {
      d();
    }
  }
}
