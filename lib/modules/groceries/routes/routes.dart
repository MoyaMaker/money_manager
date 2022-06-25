import 'package:flutter/material.dart';

import 'package:money_manager/modules/groceries/main_groceries.dart';
import 'package:money_manager/modules/groceries/pages/backup_page.dart';
import 'package:money_manager/modules/groceries/pages/new_product_page.dart';
import 'package:money_manager/modules/groceries/pages/payment_page.dart';

final groceriesRoutes = <String, Widget Function(BuildContext)>{
  'groceries': (_) => const MainGroceries(),
  'groceries/new-product': (_) => const GroceriesNewProductPage(),
  'groceries/payment': (_) => const GroceriesPaymentPage(),
  'groceries/configuration/backup-restore': (_) => const BackupPage()
};
