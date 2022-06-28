import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/widgets/cart_item_widget.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class GroceriesShoppingCartPage extends StatelessWidget {
  const GroceriesShoppingCartPage({Key? key}) : super(key: key);

  static late ShoppingCartStore _shoppingCartStore;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de compras'),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 55.0,
                  child: Observer(
                    builder: (_) => Visibility(
                        visible: _shoppingCartStore.hasItems,
                        child: CheckboxListTile(
                            title: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .color),
                                  text: 'Seleccionar todos ',
                                  children: [
                                    TextSpan(
                                        text:
                                            '(${_shoppingCartStore.countItems})',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            activeColor: Theme.of(context).colorScheme.primary,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            value: _shoppingCartStore.selectAll,
                            onChanged: (value) =>
                                _shoppingCartStore.setSelectAll(value))),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: ElevatedButton(
                    child: const Icon(Icons.add),
                    onPressed: () =>
                        Navigator.pushNamed(context, 'groceries/new-product')),
              )
            ],
          ),
          Expanded(child: Observer(builder: (_) => listItems())),
          const Divider(
            height: 0.0,
            indent: 0.0,
            thickness: 0.0,
          ),
          subtotalAndDiscount(),
          totalAndCheckout(context)
        ]));
  }

  Widget listItems() {
    if (!_shoppingCartStore.hasItems) {
      return const Center(child: Text('No hay productos en carrito'));
    }

    return ListView.separated(
        itemCount: _shoppingCartStore.countItems,
        separatorBuilder: (_, __) => const Divider(
              thickness: 0.5,
              indent: 0.0,
              height: 1.0,
              color: Colors.grey,
            ),
        itemBuilder: (context, index) => Observer(
            builder: (_) =>
                cartItem(context, index, _shoppingCartStore.cartItems[index])));
  }

  Widget cartItem(BuildContext context, int index, CartItemStore cartItem) {
    return CartItemWidget(
        key: Key(cartItem.product.id),
        cartItem: cartItem,
        updatePromotion: (CartItemStore cartItem) {
          _shoppingCartStore.editItem(index, cartItem);
        },
        onDismissed: (direction) => _shoppingCartStore.removeItem(cartItem),
        onSave: (CartItemStore cartItem) {
          _shoppingCartStore.editItem(index, cartItem);

          Navigator.pop(context);
        });
  }

  Widget subtotalAndDiscount() {
    const subtotalStyles =
        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, height: 1.25);

    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0),
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
    );
  }

  Widget totalAndCheckout(BuildContext context) {
    const totalStyles =
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.25);

    const checkoutStyles = TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.25);

    return Container(
      padding: const EdgeInsets.only(right: 10.0, bottom: 5.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Text('Total ', style: totalStyles),
                Observer(
                  builder: (_) =>
                      Text(_shoppingCartStore.total, style: totalStyles),
                )
              ],
            ),
          ),

          // Checkout
          Expanded(
            flex: 1,
            child: Observer(
                builder: (_) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0.0)),
                    onPressed: _shoppingCartStore.canCheckout
                        ? () =>
                            Navigator.pushNamed(context, 'groceries/payment')
                        : null,
                    child: const Text('Pagar', style: checkoutStyles))),
          )
        ],
      ),
    );
  }
}
