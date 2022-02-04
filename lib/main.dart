import 'package:flutter/material.dart';
import 'package:money_manager/modules/accounts/accounts_page.dart';
import 'package:money_manager/modules/expenses_control/expenses_control_page.dart';
import 'package:money_manager/modules/groceries/routes/routes.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/recipes/recipes_page.dart';
import 'package:money_manager/modules/services/services_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MoneyManagerApp());
}

class MoneyManagerApp extends StatelessWidget {
  const MoneyManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductListStore>(create: (_) => ProductListStore()),
        Provider<ShoppingCartStore>(create: (_) => ShoppingCartStore())
      ],
      child: MaterialApp(
        title: 'Money Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          // '/': (_) => const HomePage(),
          'expenses': (_) => const ExpensesControlPage(),
          'accounts': (_) => const AccountsPage(),
          'services': (_) => const ServicesPage(),
          'recipes': (_) => const RecipesPage(),
          ...groceriesRoutes
        },
      ),
    );
  }
}
