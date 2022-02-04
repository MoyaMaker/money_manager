import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/widgets/form_cart_item_widget.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class GroceriesPage extends StatelessWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  static late ShoppingCartStore _shoppingCartStore;
  static late ProductListStore _groceryListStore;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    _groceryListStore = Provider.of<ProductListStore>(context, listen: false);

    final _searchTextController = TextEditingController();

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Despensa'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'groceries/new-product'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              onChanged: (String value) =>
                  _groceryListStore.setSearchQuery(value),
              controller: _searchTextController,
              placeholder: 'Buscar',
            ),
          ),
          // Items list view
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
            maxCrossAxisExtent: 200,
            childAspectRatio: 2.08,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0),
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (ctx, index) {
          return itemWidget(ctx, items[index]);
        });
  }

  Widget itemWidget(BuildContext context, ProductStore item) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        title: Text(item.name,
            style: const TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.0)),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.unitPriceFormatted,
                style: const TextStyle(
                    fontSize: 14.0, color: Colors.blueGrey, height: 1.25)),
            OutlinedButton(
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
                    ),
                child: const Icon(Icons.add_shopping_cart)),
          ],
        ),
      ),
    );
  }
}
