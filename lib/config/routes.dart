import 'package:flutter/material.dart';

import '../home_page.dart';
import 'package:money_manager/modules/expenses_control/expenses_control_page.dart';
import 'package:money_manager/modules/accounts/accounts_page.dart';
import 'package:money_manager/modules/services/services_page.dart';
import 'package:money_manager/modules/recipes/recipes_page.dart';
import 'package:money_manager/modules/groceries/routes/routes.dart';
import 'package:money_manager/modules/credit_card/routes/routes.dart';

final mainRoutes = <String, Widget Function(BuildContext)>{
  '/': (_) => const HomePage(),
  'expenses': (_) => const ExpensesControlPage(),
  'accounts': (_) => const AccountsPage(),
  'services': (_) => const ServicesPage(),
  'recipes': (_) => const RecipesPage(),
  ...groceriesRoutes,
  ...creditCardRoutes
};
