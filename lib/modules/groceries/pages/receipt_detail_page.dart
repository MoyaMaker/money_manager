import 'package:flutter/material.dart';

import 'package:money_manager/utils/font_height.dart';

import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';

import '../models/receipt_model.dart';
import '../stores/receipt_history_store.dart';

class ReceiptDetailPage extends StatelessWidget {
  final Receipt receipt;
  final ReceiptHistoryStore receiptHistoryStore;

  const ReceiptDetailPage(
      {Key? key, required this.receipt, required this.receiptHistoryStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de compra'),
        actions: [optionsProduct(context)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Store name
            Center(
              child: Text(receipt.storeName,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: lineHeight(fontSize: 20.0, height: 22.0))),
            ),

            // Buy date
            Center(
                child: Container(
              margin: const EdgeInsets.only(bottom: 15.0),
              child: Text(receipt.buyDateFormatted,
                  style: TextStyle(
                      fontSize: 18.0,
                      height: lineHeight(fontSize: 18.0, height: 20.0))),
            )),

            // Table
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  children: [
                    TableRow(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(), bottom: BorderSide())),
                        children: [
                          tableHeader('Cant.'),
                          tableHeader('Artículo.'),
                          tableHeader('P. unit.', TextAlign.right),
                          tableHeader('Total.', TextAlign.right)
                        ]),
                    ...receipt.itemsList
                        .map((element) => listItem(element))
                        .toList()
                  ],
                ),
              ),
            ),

            // Total
            Container(
              margin: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(),
                  // Discount
                  bottomTotal('Subtotal:', receipt.subtotal),
                  // Subtotal
                  bottomTotal('Descuento:', '-${receipt.discount}',
                      const Color(0xFF0E6DFD)),
                  const Divider(),
                  // Total
                  bottomTotal(
                      'Total:', receipt.total, Colors.black, FontWeight.bold),
                ],
              ),
            ),

            // Back button
            SizedBox(
                width: double.infinity,
                height: 45.0,
                child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child:
                        const Text('Volver', style: TextStyle(fontSize: 16.0))))
          ],
        ),
      ),
    );
  }

  TableCell tableHeader(String title, [TextAlign align = TextAlign.center]) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(title,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                height: lineHeight(fontSize: 16.0, height: 18.0)),
            textAlign: align),
      ),
    );
  }

  TableRow listItem(CartItemStore cartItem) {
    final style = TextStyle(
        fontSize: 16.0, height: lineHeight(fontSize: 16.0, height: 20.0));
    final promotionsStyle = TextStyle(
        fontSize: 16.0,
        height: lineHeight(fontSize: 16.0, height: 20.0),
        color: const Color(0xFF0E6DFD));

    return TableRow(
      children: [
        // Quantity
        Text(cartItem.quantity.toString(),
            style: style, textAlign: TextAlign.center),
        // Product
        Text(cartItem.product.name, style: style, textAlign: TextAlign.center),
        // Unit price
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(cartItem.product.unitPriceFormatted,
                style: style, textAlign: TextAlign.right),
            Visibility(
                visible: cartItem.hasSomeDiscount,
                child: Text(cartItem.promotion!.value,
                    style: promotionsStyle, textAlign: TextAlign.right))
          ],
        ),
        // Subtotal
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(cartItem.subtotalFormatted,
                style: style, textAlign: TextAlign.right),
            Visibility(
                visible: cartItem.hasSomeDiscount,
                child: Text('-${cartItem.discountAmount}',
                    style: promotionsStyle, textAlign: TextAlign.right))
          ],
        )
      ],
    );
  }

  Widget bottomTotal(String text, String value,
      [Color textColor = Colors.black,
      FontWeight fontWeight = FontWeight.normal]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: fontWeight,
                color: textColor,
                height: lineHeight(fontSize: 18.0, height: 20.0)),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: fontWeight,
                color: textColor,
                height: lineHeight(fontSize: 18.0, height: 20.0)),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget optionsProduct(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: PopupMenuButton<OptionSelected>(
            padding: EdgeInsets.zero,
            tooltip: 'Opciones',
            onSelected: (OptionSelected value) {
              if (value == OptionSelected.delete) {
                showDialog<void>(
                    context: context,
                    builder: (_) => AlertDialog(
                          contentPadding: const EdgeInsets.all(10.0),
                          title: const Text(
                              '¿Seguro qué quieres eliminar el recibo de compra?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancelar')),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                  receiptHistoryStore.delete(receipt);

                                  Navigator.pop(context);
                                },
                                child: const Text('Eliminar'))
                          ],
                        ));
              }
            },
            itemBuilder: (_) => [
                  // Eliminar
                  PopupMenuItem<OptionSelected>(
                      enabled: true,
                      value: OptionSelected.delete,
                      child: Row(children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: const Icon(Icons.delete)),
                        const Text('Eliminar')
                      ])),
                ]));
  }
}

enum OptionSelected { edit, delete }
