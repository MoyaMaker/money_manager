import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/pages/groceries_new_product_page.dart';

import '../groceries_page.dart';
import '../pages/groceries_shopping_cart.dart';

final groceriesRoutes = <String, Widget Function(BuildContext)>{
  'groceries': (_) => const GroceriesPage(),
  'groceries-shopping-cart': (_) => const GroceriesShoppingCartPage(),
  'groceries-new-product': (_) => const GroceriesNewProductPage()
};
