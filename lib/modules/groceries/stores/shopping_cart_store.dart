import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/providers/shopping_cart_collection.dart';
import 'package:uuid/uuid.dart';

import 'cart_item_store.dart';

part 'shopping_cart_store.g.dart';

class ShoppingCartStore extends _ShoppingCartStore with _$ShoppingCartStore {
  ShoppingCartStore({String storeName = ''}) : super(storeName: storeName);
}

abstract class _ShoppingCartStore with Store {
  final collection = ShoppingCartCollection();

  late List<ReactionDisposer> _disposers;

  _ShoppingCartStore({this.storeName = ''}) {
    _disposers = [
      autorun((_) async {
        // Init values in list
        cartItems = ObservableList.of(collection.values);
      }, name: 'Initialize hive box and load cart items saved'),
      reaction((_) => selectAll, (bool selected) {
        for (var item in cartItems) {
          item.setHasChecked(selected);
        }

        updateAllItemsInHive();
      }, name: 'Reaction for check all items in shopping cart'),
      reaction((_) => cartItems.length, (_) => orderListForCheckedMethods(),
          name: 'Order new item when is added'),
      reaction((_) => checkedItems.length, (length) {
        /// Block order in case select all elements.
        /// Always `length` return the length of `countItems` when "select all" change to true
        /// in that case just block order when select all
        if (length == countItems) return;

        orderListForCheckedMethods();
        updateAllItemsInHive();
      }, name: 'Reaction for order list when product has checked')
    ];
  }

  @observable
  String id = const Uuid().v1();

  @observable
  ObservableList<CartItemStore> cartItems = ObservableList.of([]);

  @observable
  DateTime buyDate = DateTime.now();

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
  bool get canContinueBuy => checkedItems.isNotEmpty && storeName.isNotEmpty;

  @computed
  bool get canCheckout {
    bool valid = checkedItems.isNotEmpty;

    for (var item in checkedItems) {
      if (item.error.hasErrors) {
        valid = false;
      }
    }

    return valid;
  }

  @action
  int findItemIndex(CartItemStore cartItem) {
    return cartItems
        .indexWhere((element) => element.product.id == cartItem.product.id);
  }

  @action
  int findKeyInMap(CartItemStore cartItem) {
    final mapCartItems = collection.toMap();

    int resultKey = -1;

    mapCartItems.forEach((key, value) {
      if (value.product.id == cartItem.product.id) {
        resultKey = key;
      }
    });

    return resultKey;
  }

  @action
  void setSelectAll(bool? value) => selectAll = value!;

  @action
  void addItem(CartItemStore cartItem) {
    final indexItem = findItemIndex(cartItem);

    if (indexItem == -1) {
      cartItems.add(cartItem);
      // Save in hive
      collection.add(cartItem);
    } else {
      final oldItem = cartItems[indexItem];

      // Sum new quantity
      cartItems[indexItem].quantity = oldItem.quantity + cartItem.quantity;
      // Update unit price
      cartItems[indexItem].product.unitPrice = cartItem.product.unitPrice;

      final key = findKeyInMap(cartItem);

      collection.edit(key, cartItems[indexItem]);
    }
  }

  @action
  void editItem(int index, CartItemStore cartItem) {
    final key = findKeyInMap(cartItem);

    cartItems[index].quantity = cartItem.quantity;
    cartItems[index].product.unitPrice = cartItem.product.unitPrice;

    collection.edit(key, cartItems[index]);
  }

  @action
  void removeItem(CartItemStore cartItem) {
    final key = findKeyInMap(cartItem);

    cartItems.remove(cartItem);

    collection.delete(key);
  }

  @action
  void setBuyDate(DateTime value) => buyDate = value;

  @action
  void setStoreName(String value) => storeName = value;

  @action
  void orderListForCheckedMethods() {
    final copyList = cartItems;

    copyList.sort(((a, b) => a.hasChecked ? 1 : -1));

    cartItems = ObservableList.of(copyList);
  }

  @action
  void cleanCart() {
    storeName = '';
    buyDate = DateTime.now();
    selectAll = false;

    for (var item in checkedItems) {
      removeItem(item);
    }
  }

  @action
  bool? thisItemIsChecked(CartItemStore item) {
    return checkedItems
        .firstWhere((element) => element.product.id == item.product.id)
        .hasChecked;
  }

  /// Update items in box
  /// To save when item has checked
  @action
  void updateAllItemsInHive() {
    for (var element in cartItems) {
      final key = findKeyInMap(element);
      collection.edit(key, element);
    }
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}
