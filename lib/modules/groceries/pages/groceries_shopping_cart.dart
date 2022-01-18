import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/widgets/quantity_widget.dart';
import 'package:provider/provider.dart';

class GroceriesShoppingCartPage extends StatefulWidget {
  const GroceriesShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<GroceriesShoppingCartPage> createState() =>
      _GroceriesShoppingCartPageState();
}

class _GroceriesShoppingCartPageState extends State<GroceriesShoppingCartPage> {
  static late ShoppingCartStore _shoppingCartStore;

  static final quantityController = <TextEditingController>[];

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de compras')),
      body: Observer(builder: (_) => listItems()),
    );
  }

  Widget listItems() {
    if (!_shoppingCartStore.hasItems) {
      return const Center(child: Text('No hay elementos en lista'));
    }

    return ListView.separated(
        itemCount: _shoppingCartStore.countItems,
        separatorBuilder: (_, __) => const Divider(
              color: Colors.grey,
            ),
        itemBuilder: (context, index) {
          final item = _shoppingCartStore.items[index];
          quantityController
              .add(TextEditingController(text: item.quantity.toString()));

          return Observer(
              builder: (_) =>
                  cartItem(context, item, quantityController[index]));
        });
  }

  Widget cartItem(BuildContext context, CartItemStore cartItem,
      TextEditingController textEditingController) {
    return Dismissible(
      key: Key(cartItem.item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, size: 40.0, color: Colors.white),
      ),
      onDismissed: (direction) {
        _shoppingCartStore.removeItem(cartItem);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.item.name,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(cartItem.item.unitPriceFormatted,
                    style: TextStyle(fontSize: 13.0, color: Colors.grey[600])),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(cartItem.price,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ],
            ),
            QuantityWidget(
                item: cartItem.item,
                quantity: cartItem.quantity,
                textEditingController: textEditingController,
                onSave: () {
                  cartItem.setValue(double.parse(textEditingController.text));
                  setState(() {});
                  Navigator.pop(context);
                },
                onSubmitted: (String newValue) {
                  cartItem.setValue(double.parse(newValue));
                  setState(() {});
                  Navigator.pop(context);
                },
                onAdd: () {
                  cartItem.add();
                  textEditingController.text = cartItem.quantity.toString();
                  setState(() {});
                },
                onRemove: () {
                  cartItem.remove();
                  textEditingController.text = cartItem.quantity.toString();
                  setState(() {});
                })
          ],
        ),
      ),
    );
  }

  Widget buttonQuantity(Icon icon, void Function() onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(padding: const EdgeInsets.all(10.0), child: icon),
      onTap: onTap,
    );
  }
}
