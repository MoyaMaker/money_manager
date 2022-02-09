import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

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
      children: [
        TextField(
          controller: _nameController,
        ),
        TextField(
          controller: _priceController,
        ),
      ],
    );
  }
}
