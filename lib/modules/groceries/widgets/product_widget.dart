import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/widgets/edit_product_widget.dart';
import 'package:money_manager/utils/font_height.dart';

import 'form_cart_item_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductStore product;
  final ValueChanged<ProductStore> onEdit;
  final VoidCallback onDelete;
  final ValueChanged<CartItemStore> onAddToCart;

  const ProductWidget(
      {Key? key,
      required this.product,
      required this.onEdit,
      required this.onDelete,
      required this.onAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                color: Color.fromRGBO(0, 0, 0, 0.1))
          ],
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              optionsProduct(context),
              // Name
              Observer(builder: (_) => name()),
              // Price formatted
              Observer(builder: (_) => price()),
            ],
          ),
          // Button add to shopping cart
          button(context)
        ],
      ),
    );
  }

  Widget optionsProduct(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: PopupMenuButton<OptionSelected>(
            padding: EdgeInsets.zero,
            tooltip: 'Opciones',
            onSelected: (OptionSelected value) {
              if (value == OptionSelected.edit) {
                showDialog<void>(
                    context: context,
                    builder: (_) =>
                        EditProductWidget(product: product, onSave: onEdit));
              } else if (value == OptionSelected.delete) {
                showDialog<void>(
                    context: context,
                    builder: (_) => AlertDialog(
                          contentPadding: const EdgeInsets.all(10.0),
                          title: const Text(
                              '¿Seguro qué quieres eliminar el producto?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancelar')),
                            ElevatedButton(
                                onPressed: onDelete,
                                child: const Text('Eliminar'))
                          ],
                        ));
              }
            },
            itemBuilder: (_) => [
                  // Editar
                  PopupMenuItem<OptionSelected>(
                      enabled: true,
                      value: OptionSelected.edit,
                      child: Row(children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: const Icon(Icons.edit)),
                        const Text('Editar')
                      ])),

                  const PopupMenuDivider(),

                  // Eliminar
                  PopupMenuItem<OptionSelected>(
                      enabled: true,
                      value: OptionSelected.delete,
                      child: Row(children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: const Icon(Icons.delete)),
                        const Text('Eliminar')
                      ]))
                ]));
  }

  Widget name() {
    return Container(
      padding: const EdgeInsets.only(right: 10.0, bottom: 2.0, left: 10.0),
      child: Text(product.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              height: lineHeight(fontSize: 16.0, height: 18.0))),
    );
  }

  Widget price() {
    return Text(product.unitPriceFormatted,
        style: TextStyle(
            fontSize: 14.0, height: lineHeight(fontSize: 14.0, height: 16.0)));
  }

  Widget button(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.0,
      padding: const EdgeInsets.only(right: 10.0, bottom: 10.0, left: 10.0),
      child: OutlinedButton(
          onPressed: () => showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return FormCartItem(product: product, onSave: onAddToCart);
                },
              ),
          child: const Icon(Icons.add_shopping_cart)),
    );
  }
}

enum OptionSelected { edit, delete }
