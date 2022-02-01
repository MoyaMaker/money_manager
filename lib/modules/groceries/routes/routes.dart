import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/main_groceries.dart';
import 'package:money_manager/modules/groceries/pages/new_product_page.dart';
import 'package:money_manager/modules/groceries/pages/payment_page.dart';
import 'package:money_manager/modules/groceries/pages/shopping_detail_page.dart';
import 'package:money_manager/modules/groceries/pages/shopping_history_page.dart';

import '../pages/groceries_page.dart';
import '../pages/shopping_cart_page.dart';

final groceriesRoutes = <String, Widget Function(BuildContext)>{
  '/': (_) => const MainGroceries(),
  'groceries': (_) => const GroceriesPage(),
  'groceries/shopping-cart': (_) => const GroceriesShoppingCartPage(),
  'groceries/new-product': (_) => const GroceriesNewProductPage(),
  'groceries/payment': (_) => const GroceriesPaymentPage(),
  'groceries/shopping-history': (_) => const GroceriesShoppingHistoryPage(),
  'groceries/shopping-detail': (_) => const GroceriesShoppingDetailPage(),
};
