import 'package:provider/provider.dart';

import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';

final providers = [
  Provider<ProductListStore>(create: (_) => ProductListStore()),
  Provider<ShoppingCartStore>(create: (_) => ShoppingCartStore()),
  Provider<ReceiptHistoryStore>(create: (_) => ReceiptHistoryStore())
];
