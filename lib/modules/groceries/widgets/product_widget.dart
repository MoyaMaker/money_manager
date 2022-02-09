import 'package:flutter/material.dart';

import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/widgets/edit_product_widget.dart';
import 'package:money_manager/utils/font_height.dart';

import 'form_cart_item_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductStore product;
  final ValueChanged<ProductStore> onEdit;
  final ValueChanged<CartItemStore> onAddToCart;

  const ProductWidget(
      {Key? key,
      required this.product,
      required this.onEdit,
      required this.onAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            color: Color.fromRGBO(0, 0, 0, 0.1))
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              optionsProduct(context),
              // Name
              name(),
              // Price formatted
              price(),
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
              }
            },
            itemBuilder: (_) => [
                  option(
                      value: OptionSelected.edit,
                      icon: const Icon(Icons.edit),
                      name: 'Editar'),
                  const PopupMenuDivider(),
                  option(
                      value: OptionSelected.delete,
                      icon: const Icon(Icons.delete),
                      name: 'Eliminar'),
                ]));
  }

  PopupMenuEntry<OptionSelected> option(
      {required OptionSelected value,
      required Icon icon,
      required String name}) {
    return PopupMenuItem<OptionSelected>(
        value: value,
        child: Row(children: [
          Container(margin: const EdgeInsets.only(right: 10.0), child: icon),
          Text(name)
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
            fontSize: 14.0,
            color: Colors.blueGrey,
            height: lineHeight(fontSize: 14.0, height: 16.0)));
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
