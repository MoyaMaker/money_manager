import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/pages/groceries_page.dart';
import 'package:money_manager/modules/groceries/pages/settings_page.dart';
import 'package:money_manager/modules/groceries/pages/shopping_cart_page.dart';
import 'package:money_manager/modules/groceries/pages/receipt_history_page.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:provider/provider.dart';

class MainGroceries extends StatefulWidget {
  const MainGroceries({Key? key}) : super(key: key);

  @override
  State<MainGroceries> createState() => _MainGroceriesState();
}

class _MainGroceriesState extends State<MainGroceries> {
  late PageController _pageController;

  int _activePage = 0;

  late ShoppingCartStore _shoppingCartStore;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        // Prevent close app in other page different to home
        if (_activePage != 0) {
          _pageController.jumpTo(0);
          return false;
        }

        return true;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _activePage,
            onTap: (value) => setState(() => _pageController.jumpToPage(value)),
            iconSize: 32.0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: _activePage == 0
                      ? const Icon(Icons.home)
                      : const Icon(Icons.home_outlined),
                  label: 'Inicio'),
              BottomNavigationBarItem(icon: _shoppingCart(1), label: 'Carrito'),
              BottomNavigationBarItem(
                  icon: _activePage == 2
                      ? const Icon(Icons.history)
                      : const Icon(Icons.history_outlined),
                  label: 'Historial'),
              BottomNavigationBarItem(
                  icon: _activePage == 3
                      ? const Icon(Icons.settings)
                      : const Icon(Icons.settings_outlined),
                  label: 'Configuración')
            ]),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) => setState(() => _activePage = value),
          children: const [
            GroceriesPage(),
            GroceriesShoppingCartPage(),
            ReceiptHistoryPage(),
            SettingsPage()
          ],
        ),
      ),
    );
  }

  Widget _shoppingCart(int activeIndex) {
    return Stack(alignment: Alignment.center, children: [
      Icon(
          _activePage == activeIndex
              ? Icons.shopping_cart
              : Icons.shopping_cart_outlined,
          semanticLabel: 'Shopping cart'),
      Positioned(
          top: 0.0,
          right: 0.0,
          child: Observer(
            builder: (_) => Visibility(
                visible: _shoppingCartStore.hasItems,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    minWidth: 16.0,
                    minHeight: 16.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(_shoppingCartStore.countItems.toString(),
                      style:
                          const TextStyle(fontSize: 8.0, color: Colors.white),
                      textAlign: TextAlign.center),
                )),
          ))
    ]);
  }
}
