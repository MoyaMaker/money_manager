import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/utils/math_double_util.dart';

import '../stores/form_validation/form_cart_item_store.dart';

class FormCartItem extends StatelessWidget {
  final ProductStore product;
  final double? quantity;
  final ValueChanged<CartItemStore> onSave;

  static late FormCartItemStore formCartItemStore;

  const FormCartItem(
      {Key? key, required this.product, this.quantity, required this.onSave})
      : super(key: key);

  static late TextEditingController _priceController;
  static late TextEditingController _quantityController;

  @override
  Widget build(BuildContext context) {
    _priceController =
        TextEditingController(text: product.unitPrice.toString());
    _quantityController = TextEditingController(text: '${quantity ?? '1'}');

    formCartItemStore =
        FormCartItemStore(product.unitPrice.toString(), '${quantity ?? '1'}');

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(15.0),
      children: [
        // Item name
        Text(product.name,
            style:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        // Price
        Observer(
          builder: (_) => TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onChanged: (String value) => formCartItemStore.setPrice(value),
            decoration: InputDecoration(
                icon: const Icon(Icons.attach_money),
                errorText: formCartItemStore.error.price),
          ),
        ),
        // Quantity
        Observer(
          builder: (_) => TextFormField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onChanged: (String value) => formCartItemStore.setQuantity(value),
            autofocus: true,
            decoration: InputDecoration(
                icon: const Icon(Icons.shopping_basket),
                errorText: formCartItemStore.error.quantity),
            onFieldSubmitted: (String newValue) =>
                formCartItemStore.error.hasErrors ? null : onSave(_cartItem),
          ),
        ),

        // Add button
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: OutlinedButton.icon(
              onPressed: () =>
                  formCartItemStore.error.hasErrors ? null : onSave(_cartItem),
              icon: const Icon(Icons.add),
              label: const Text('Agregar')),
        )
      ],
    );
  }

  CartItemStore get _cartItem => CartItemStore(
      product: ProductStore(
          id: product.id,
          name: product.name,
          unitPrice: stringToDouble(_priceController.text)),
      quantity: stringToDouble(_quantityController.text));
}
