import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/utils/math_double_utils.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class GroceriesNewProductPage extends StatelessWidget {
  const GroceriesNewProductPage({Key? key}) : super(key: key);

  static late GroceryListStore _groceryListStore;
  static late ShoppingCartStore _shoppingCartStore;

  static final _formKey = GlobalKey<FormState>();

  static final _productNameController = TextEditingController();
  static final _unitPriceController = TextEditingController();
  static final _quantityController = TextEditingController(text: '1.0');

  @override
  Widget build(BuildContext context) {
    _groceryListStore = Provider.of<GroceryListStore>(context, listen: false);
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo producto'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(label: Text('Producto')),
              ),
              TextFormField(
                controller: _unitPriceController,
                decoration: const InputDecoration(
                    label: Text('Precio unitario'),
                    icon: Text(r'$',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold))),
              ),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text('Cantidad')),
              ),
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
    final item = GroceryItemStore(
        id: const Uuid().v1(),
        name: _productNameController.text,
        unitPrice: stringToDouble(_unitPriceController.text));

    _groceryListStore.add(item);

    final cartItem = CartItemStore(
        item: item, quantity: stringToDouble(_quantityController.text));

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
