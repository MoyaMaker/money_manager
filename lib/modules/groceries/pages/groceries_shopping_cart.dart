import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class GroceriesShoppingCartPage extends StatelessWidget {
  const GroceriesShoppingCartPage({Key? key}) : super(key: key);

  static late ShoppingCartStore _shoppingCartStore;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de compras')),
      body: Column(
        children: [
          Expanded(child: Observer(builder: (_) => listItems())),
          bottomSheetTotal()
        ],
      ),
    );
  }

  Widget listItems() {
    if (!_shoppingCartStore.hasItems) {
      return const Center(child: Text('No hay elementos en lista'));
    }

    return ListView.separated(
        itemCount: _shoppingCartStore.countItems,
        separatorBuilder: (_, __) => const Divider(
              thickness: 0.5,
              indent: 0.0,
              height: 1.0,
              color: Colors.grey,
            ),
        itemBuilder: (context, index) =>
            cartItem(context, _shoppingCartStore.items[index]));
  }

  Widget cartItem(BuildContext context, CartItemStore cartItem) {
    return CartItem(
        key: Key(cartItem.item.id),
        cartItem: cartItem,
        onDismissed: (direction) => _shoppingCartStore.removeItem(cartItem),
        onSave: (CartItemStore cartItem) {
          _shoppingCartStore.addItem(cartItem);

          Navigator.pop(context);
        });
  }

  Widget bottomSheetTotal() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Observer(
              builder: (_) => Text(_shoppingCartStore.total,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
