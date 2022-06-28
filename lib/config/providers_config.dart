import 'package:provider/provider.dart';

import 'package:money_manager/modules/credit_card/stores/credit_card_store.dart';
import 'package:money_manager/modules/groceries/stores/settings/theme_mode_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';

final providers = [
  Provider<ProductListStore>(
      create: (_) => ProductListStore(),
      dispose: (_, store) => store.dispose()),
  Provider<ShoppingCartStore>(
      create: (_) => ShoppingCartStore(),
      dispose: (_, store) => store.dispose()),
  Provider<ReceiptHistoryStore>(
      create: (_) => ReceiptHistoryStore(),
      dispose: (_, store) => store.dispose()),
  Provider<CreditCardListStore>(
      create: (_) => CreditCardListStore(),
      dispose: (_, store) => store.dispose()),
  Provider<ThemeModeStore>(
      create: (_) => ThemeModeStore(), dispose: (_, store) => store.dispose())
];
