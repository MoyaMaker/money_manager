import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/utils/math_double_util.dart';

class EditProductWidget extends StatelessWidget {
  final ProductStore product;
  final ValueChanged<ProductStore> onSave;

  const EditProductWidget(
      {Key? key, required this.product, required this.onSave})
      : super(key: key);

  static late TextEditingController _nameController;
  static late TextEditingController _priceController;

  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController(text: product.name);

    _priceController =
        TextEditingController(text: product.unitPrice.toString());

    return SimpleDialog(
      title: const Text('Editar producto'),
      titlePadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      children: [
        //
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(label: Text('Producto')),
        ),
        TextField(
          controller: _priceController,
          decoration: const InputDecoration(label: Text('Precio unitario')),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          height: 40.0,
          child: ElevatedButton(
              onPressed: () {
                product.name = _nameController.text;
                product.unitPrice = stringToDouble(_priceController.text);

                onSave(product);
              },
              child: const Text('Guardar',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))),
        )
      ],
    );
  }
}
