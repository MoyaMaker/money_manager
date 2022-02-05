import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/utils/math_double_util.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class GroceriesNewProductPage extends StatelessWidget {
  const GroceriesNewProductPage({Key? key}) : super(key: key);

  static late ProductListStore _productListStore;
  static late ShoppingCartStore _shoppingCartStore;

  static final _formKey = GlobalKey<FormState>();

  static final _productNameController = TextEditingController();
  static final _unitPriceController = TextEditingController();
  static final _quantityController = TextEditingController(text: '1.0');

  @override
  Widget build(BuildContext context) {
    _productListStore = Provider.of<ProductListStore>(context, listen: false);
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Nuevo producto'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              // Product name
              TextFormField(
                controller: _productNameController,
                textInputAction: TextInputAction.next,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(label: Text('Producto')),
              ),
              // Unit price
              TextFormField(
                controller: _unitPriceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('Precio unitario'),
                    icon: Icon(Icons.attach_money)),
              ),
              // Quantity
              TextFormField(
                controller: _quantityController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('Cantidad'), icon: Icon(Icons.shopping_basket)),
                onFieldSubmitted: (String value) => onSave(context),
              ),
              // Save button
              Container(
                width: double.infinity,
                height: 55.0,
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                child: ElevatedButton.icon(
                    onPressed: () => onSave(context),
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar',
                        style: TextStyle(fontSize: 18.0))),
              )
            ]),
          )),
    );
  }

  void onSave(BuildContext context) {
    final product = ProductStore(
        id: const Uuid().v1(),
        name: _productNameController.text,
        unitPrice: stringToDouble(_unitPriceController.text));

    _productListStore.add(product);

    _productListStore.createProduct(product);

    final cartItem = CartItemStore(
        product: product, quantity: stringToDouble(_quantityController.text));

    _shoppingCartStore.addItem(cartItem);

    clean();

    Navigator.pop(context);
  }

  void clean() {
    _productNameController.clear();
    _unitPriceController.clear();
    _quantityController.clear();
  }
}
