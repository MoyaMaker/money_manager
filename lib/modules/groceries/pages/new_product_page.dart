import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/new_product_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/utils/math_double_util.dart';
import 'package:provider/provider.dart';

class GroceriesNewProductPage extends StatelessWidget {
  const GroceriesNewProductPage({Key? key}) : super(key: key);

  // Stores
  static late ProductListStore _productListStore;
  static late ShoppingCartStore _shoppingCartStore;
  static final FormNewProduct formNewProduct = FormNewProduct();

  // Focus nodes
  static late FocusNode _nameFocus;
  static late FocusNode _unitPriceFocus;
  static late FocusNode _quantityFocus;

  @override
  Widget build(BuildContext context) {
    _productListStore = Provider.of<ProductListStore>(context, listen: false);
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);

    _nameFocus = FocusNode();
    _unitPriceFocus = FocusNode();
    _quantityFocus = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo producto'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          // Product name
          Observer(
            builder: (_) => TextFormField(
              focusNode: _nameFocus,
              textInputAction: TextInputAction.next,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (String value) => formNewProduct.setName(value),
              decoration: InputDecoration(
                  label: const Text('Producto'),
                  errorText: formNewProduct.error.name),
            ),
          ),
          // Unit price
          Observer(
            builder: (_) => TextFormField(
              focusNode: _unitPriceFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onChanged: (String value) => formNewProduct.setUnitPrice(value),
              decoration: InputDecoration(
                  label: const Text('Precio unitario'),
                  icon: const Icon(Icons.attach_money),
                  errorText: formNewProduct.error.unitPrice),
            ),
          ),
          // Quantity
          Observer(
            builder: (_) => TextFormField(
              initialValue: '1',
              focusNode: _quantityFocus,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onChanged: (String value) => formNewProduct.setQuantity(value),
              decoration: InputDecoration(
                  label: const Text('Cantidad'),
                  icon: const Icon(Icons.shopping_basket),
                  errorText: formNewProduct.error.quantity),
              onFieldSubmitted: (String value) => onSave(context),
            ),
          ),
          // Save button
          Container(
            width: double.infinity,
            height: 55.0,
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            child: ElevatedButton.icon(
                onPressed: () => onSave(context),
                icon: const Icon(Icons.add),
                label: const Text('Agregar', style: TextStyle(fontSize: 18.0))),
          )
        ]),
      )),
    );
  }

  void onSave(BuildContext context) {
    formNewProduct.validateAll();

    if (formNewProduct.canSave) {
      final newProduct = _productListStore.add(
          formNewProduct.name, stringToDouble(formNewProduct.unitPrice));

      final cartItem = CartItemStore(
          product: newProduct,
          quantity: stringToDouble(formNewProduct.quantity));

      _shoppingCartStore.addItem(cartItem);

      Navigator.pop(context);
    } else if (formNewProduct.error.name != null) {
      _nameFocus.requestFocus();
    } else if (formNewProduct.error.unitPrice != null) {
      _unitPriceFocus.requestFocus();
    } else if (formNewProduct.error.quantity != null) {
      _quantityFocus.requestFocus();
    }
  }
}
