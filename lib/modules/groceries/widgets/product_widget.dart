import 'package:flutter/material.dart';

import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/utils/font_height.dart';

import 'form_cart_item_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductStore product;
  final ValueChanged<CartItemStore> onSave;

  const ProductWidget({Key? key, required this.product, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
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

  Widget name() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 2.0),
      child: Text(product.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              height: lineHeight(fontSize: 18.0, height: 20.0))),
    );
  }

  Widget price() {
    return Text(product.unitPriceFormatted,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.blueGrey,
            height: lineHeight(fontSize: 16.0, height: 18.0)));
  }

  Widget button(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.0,
      child: OutlinedButton(
          onPressed: () => showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return FormCartItem(product: product, onSave: onSave);
                },
              ),
          child: const Icon(Icons.add_shopping_cart)),
    );
  }
}
