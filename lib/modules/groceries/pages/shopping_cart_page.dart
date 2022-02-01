import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
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
      appBar: const CupertinoNavigationBar(
        middle: Text('Lista de compras'),
      ),
      body: Column(
        children: [
          Expanded(child: Observer(builder: (_) => listItems())),
          bottomSheetTotal(context)
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

  Widget bottomSheetTotal(BuildContext context) {
    const subtotalStyles =
        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, height: 1.25);

    const totalStyles =
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.25);

    const checkoutStyles = TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.25);

    return Column(
      children: [
        const Divider(
          height: 0.0,
          indent: 0.0,
          thickness: 0.0,
        ),

        // Subtotal
        // Discount
        Observer(
          builder: (_) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal', style: subtotalStyles),
                    Text(_shoppingCartStore.subtotal, style: subtotalStyles),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Descuento', style: subtotalStyles),
                    Text(_shoppingCartStore.discount, style: subtotalStyles),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Total
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total', style: totalStyles),
              Observer(
                builder: (_) =>
                    Text(_shoppingCartStore.total, style: totalStyles),
              )
            ],
          ),
        ),

        // Checkout
        Observer(
            builder: (_) => Container(
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0)),
                      onPressed: _shoppingCartStore.hasItems
                          ? () =>
                              Navigator.pushNamed(context, 'groceries/payment')
                          : null,
                      child: const Text('Pagar', style: checkoutStyles)),
                ))
      ],
    );
  }
}
