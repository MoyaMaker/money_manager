import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';
import 'package:money_manager/utils/math_double_utils.dart';

class FormCartItem extends StatelessWidget {
  final GroceryItemStore item;
  final double? quantity;
  final ValueChanged<CartItemStore> onSave;

  const FormCartItem(
      {Key? key, required this.item, this.quantity, required this.onSave})
      : super(key: key);

  static late TextEditingController _priceController;
  static late TextEditingController _quantityController;

  @override
  Widget build(BuildContext context) {
    final double quantity = this.quantity ?? 1;
    _priceController = TextEditingController(text: item.unitPrice.toString());
    _quantityController = TextEditingController(text: quantity.toString());

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(15.0),
      children: [
        // Item name
        Text(item.name,
            style:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        // Price
        TextField(
          controller: _priceController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(icon: Icon(Icons.attach_money)),
        ),
        // Quantity
        TextField(
          controller: _quantityController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          autofocus: true,
          decoration: const InputDecoration(icon: Icon(Icons.shopping_basket)),
          onSubmitted: (String newValue) => onSave(_cartItem),
        ),

        // Add button
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: OutlinedButton.icon(
              onPressed: () => onSave(_cartItem),
              icon: const Icon(Icons.add),
              label: const Text('Agregar')),
        )
      ],
    );
  }

  CartItemStore get _cartItem => CartItemStore(
      item: GroceryItemStore(
          id: item.id,
          name: item.name,
          unitPrice: stringToDouble(_priceController.text)),
      quantity: stringToDouble(_quantityController.text));
}
