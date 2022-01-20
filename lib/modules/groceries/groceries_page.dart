import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/utils/math_double_utils.dart';

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {
  late ShoppingCartStore _shoppingCartStore;
  late GroceryListStore _groceryListStore;

  final priceController = TextEditingController();
  final quantityController = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    _groceryListStore = Provider.of<GroceryListStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Despensa'),
        actions: [
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, 'groceries-shopping-cart'),
            child: Stack(alignment: Alignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_cart, size: 24.0),
              ),
              Positioned(
                  top: 5.0,
                  right: 2.0,
                  child: Observer(
                    builder: (_) => Visibility(
                      visible: _shoppingCartStore.hasItems,
                      child: Container(
                          width: 20.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Text(_shoppingCartStore.countItems.toString(),
                              style: const TextStyle(fontSize: 12.0))),
                    ),
                  ))
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Nuevo producto',
        onPressed: () => Navigator.pushNamed(context, 'groceries-new-product'),
      ),
      body: Observer(builder: (_) => gridItems()),
    );
  }

  Widget gridItems() {
    return GridView.builder(
        itemCount: _groceryListStore.items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.5,
            mainAxisSpacing: 5.0),
        itemBuilder: (ctx, index) {
          return itemWidget(ctx, _groceryListStore.items[index]);
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
              onPressed: () => openForm(item),
              icon: const Icon(Icons.add),
              label: const Text('Agregar'))
        ],
      ),
    );
  }

  void openForm(GroceryItemStore item) {
    priceController.text = item.unitPrice.toString();

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(15.0),
          children: [
            Text(item.name,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold)),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(icon: Icon(Icons.attach_money)),
            ),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autofocus: true,
              decoration:
                  const InputDecoration(icon: Icon(Icons.shopping_basket)),
              onSubmitted: (String newValue) => addToShoppingCart(item),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: OutlinedButton.icon(
                  onPressed: () => addToShoppingCart(item),
                  icon: const Icon(Icons.add),
                  label: const Text('Agregar')),
            )
          ],
        );
      },
    );
  }

  void addToShoppingCart(GroceryItemStore item) {
    final cartItem = CartItemStore(
        item: GroceryItemStore(
            id: item.id,
            name: item.name,
            unitPrice: stringToDouble(priceController.text)),
        quantity: stringToDouble(quantityController.text));

    _shoppingCartStore.addItem(cartItem);

    Navigator.pop(context);

    // Reset `quantityController`
    quantityController.text = '1';
  }
}
