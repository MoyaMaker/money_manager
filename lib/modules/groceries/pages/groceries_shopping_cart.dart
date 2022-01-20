import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/widgets/form_cart_item_widget.dart';

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
    return Observer(
      builder: (_) => Dismissible(
        key: Key(cartItem.item.id),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: const EdgeInsets.all(15.0),
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Icon(Icons.delete, size: 40.0, color: Colors.white),
        ),
        onDismissed: (direction) => _shoppingCartStore.removeItem(cartItem),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(cartItem.item.name,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    // Unit price
                    Text(cartItem.item.unitPriceFormatted,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.grey[600])),
                    // Subtotal Price
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(cartItem.priceFormatted,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),

              // Quantity
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text('Cantidad',
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.grey[600])),
                    Container(
                        width: 70.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(cartItem.quantity.toString(),
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),

              // Edit button
              IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return FormCartItem(
                              item: cartItem.item,
                              quantity: cartItem.quantity,
                              onSave: (CartItemStore cartItem) {
                                _shoppingCartStore.addItem(cartItem);

                                Navigator.pop(context);
                              });
                        },
                      ))
            ],
          ),
        ),
      ),
    );
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
