import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

import 'cart_item_store.dart';
import 'product_store.dart';

part 'payment_store.g.dart';

class PaymentStore extends _PaymentStore with _$PaymentStore {
  PaymentStore(
      {required ReceiptHistoryStore receiptHistoryStore,
      required ShoppingCartStore shoppingCartStore,
      required ProductListStore productListStore})
      : super(
            receiptHistoryStore: receiptHistoryStore,
            shoppingCartStore: shoppingCartStore,
            productListStore: productListStore);
}

abstract class _PaymentStore with Store {
  _PaymentStore(
      {required this.receiptHistoryStore,
      required this.shoppingCartStore,
      required this.productListStore});

  late ShoppingCartStore shoppingCartStore;

  late ReceiptHistoryStore receiptHistoryStore;

  late ProductListStore productListStore;

  @action
  void createReceipt() {
    receiptHistoryStore.saveReceipt(
        shoppingCartStore.id,
        shoppingCartStore.storeName,
        shoppingCartStore.buyDate,
        shoppingCartStore.checkedItems);

    updatePriceItem(shoppingCartStore.checkedItems);

    // Clear cart
    shoppingCartStore.cleanCart();
  }

  @action
  void updatePriceItem(List<CartItemStore> checkedItems) {
    for (var item in checkedItems) {
      productListStore.edit(item.product);
    }
  }
}
