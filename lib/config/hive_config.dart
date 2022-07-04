import 'package:hive_flutter/hive_flutter.dart';

import 'package:money_manager/modules/credit_card/stores/credit_card_store.dart';
import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';
import 'package:money_manager/modules/groceries/models/receipt_model.dart';
import 'package:money_manager/modules/groceries/providers/products_collection.dart';
import 'package:money_manager/modules/groceries/providers/settings_collection.dart';
import 'package:money_manager/modules/groceries/providers/shopping_cart_collection.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/settings/theme_mode_store.dart';

hiveConfig() async {
  await Hive.initFlutter();
  Hive
        ..registerAdapter(ProductHiveAdapter()) // TypeId 0
        ..registerAdapter(CartItemAdapter()) // TypeId 1
        ..registerAdapter(PromotionsAdapter()) // TypeId 2
        ..registerAdapter(ReceiptAdapter()) // TypeId 3
        ..registerAdapter(CreditCardAdapter()) // TypeId 4
        ..registerAdapter(ThemeModeAdapter()) // TypeId 5
      ;

  // Init box for settings provider
  await Hive.openBox(SettingsCollection.boxName);

  // Open box to loading products
  await Hive.openBox<ProductStore>(ProductsCollection.boxName);

  // Open box to load shopping cart
  await ContainerShoppingCartCollection().init();
}
