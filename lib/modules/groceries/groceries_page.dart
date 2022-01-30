import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/widgets/form_cart_item_widget.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

import 'widgets/bottom_navigation_bar_widget.dart';

class GroceriesPage extends StatelessWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  static late ShoppingCartStore _shoppingCartStore;
  static late GroceryListStore _groceryListStore;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    _groceryListStore = Provider.of<GroceryListStore>(context, listen: false);

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Despensa'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'groceries/new-product'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const GroceriesBottomNavigation(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              onChanged: (String value) =>
                  _groceryListStore.setSearchQuery(value),
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                  hintText: 'Buscar',
                  icon: Icon(Icons.search)),
            ),
          ),
          Expanded(
              child: SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: Observer(builder: (_) => gridItems()))),
        ],
      ),
    );
  }

  Widget gridItems() {
    final items = _groceryListStore.filteredItems;

    if (items.isEmpty) {
      return const Center(
        child: Text('No hay elementos en lista'),
      );
    }

    return GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.4,
            mainAxisSpacing: 5.0),
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (ctx, index) {
          return itemWidget(ctx, items[index]);
        });
  }

  Widget itemWidget(BuildContext context, GroceryItemStore item) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            title: Text(item.name,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold)),
            subtitle: Text(item.unitPriceFormatted,
                style: const TextStyle(fontSize: 14.0, color: Colors.blueGrey)),
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Agregar'),
              onPressed: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return FormCartItem(
                          item: item,
                          onSave: (CartItemStore cartItem) {
                            _shoppingCartStore.addItem(cartItem);

                            Navigator.pop(context);
                          });
                    },
                  ))
        ],
      ),
    );
  }
}
