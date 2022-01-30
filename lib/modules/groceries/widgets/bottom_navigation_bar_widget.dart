import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class GroceriesBottomNavigation extends StatelessWidget {
  const GroceriesBottomNavigation({Key? key}) : super(key: key);

  static late ShoppingCartStore _shoppingCartStore;

  final double _iconSize = 36.0;
  final Color _iconColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);

    return SizedBox(
      height: 66.0,
      child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navigationItem(
                      icon: const Icon(Icons.home_outlined,
                          semanticLabel: 'Home')),
                  shoppingCart(context),
                ]),
          )),
    );
  }

  Widget navigationItem({required Icon icon}) {
    return IconButton(
        icon: icon, iconSize: _iconSize, color: _iconColor, onPressed: () {});
  }

  Widget shoppingCart(BuildContext context) {
    return SizedBox(
      height: 66.0,
      child: InkResponse(
        onTap: () => Navigator.pushNamed(context, 'groceries/shopping-cart'),
        child: Stack(alignment: Alignment.center, children: [
          Icon(Icons.shopping_cart_outlined,
              size: _iconSize,
              color: _iconColor,
              semanticLabel: 'Shopping cart'),
          Positioned(
              top: 10.0,
              right: 0.0,
              child: Observer(
                builder: (_) => Visibility(
                  visible: _shoppingCartStore.hasItems,
                  child: Container(
                      width: 20.0,
                      height: 20.0,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(3.0),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: Text(_shoppingCartStore.countItems.toString(),
                          style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              ))
        ]),
      ),
    );
  }
}
