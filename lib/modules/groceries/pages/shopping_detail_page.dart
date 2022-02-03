import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/utils/font_height.dart';

class GroceriesShoppingDetailPage extends StatelessWidget {
  final ShoppingCartStore shopItem;
  const GroceriesShoppingDetailPage({Key? key, required this.shopItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Detalle de compra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Store name
            Center(
              child: Text(shopItem.storeName,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 1.25)),
            ),
            // Buy date
            Center(
                child: Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              child: Text(shopItem.buyDateFormatted,
                  style: const TextStyle(fontSize: 18.0, height: 1.25)),
            )),
            // Table
            Table(children: [
              TableRow(
                  decoration: const BoxDecoration(
                      border: Border(top: BorderSide(), bottom: BorderSide())),
                  children: [
                    tableHeader('Cant.'),
                    tableHeader('Artículo.'),
                    tableHeader('P. unit.', TextAlign.right),
                    tableHeader('Total.', TextAlign.right)
                  ])
            ]),
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  children: [
                    // ...List.generate(
                    //     50, (index) => listItem(shopItem.items[0])),
                    ...shopItem.items
                        .map((element) => listItem(element))
                        .toList()
                  ],
                ),
              ),
            ),

            // Total
            Container(
              margin: const EdgeInsets.only(bottom: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Subtotal:',
                          style: TextStyle(
                              fontSize: 16.0,
                              height: lineHeight(fontSize: 16.0, height: 18.0)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          shopItem.subtotal,
                          style: TextStyle(
                              fontSize: 16.0,
                              height: lineHeight(fontSize: 16.0, height: 18.0)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Descuento:',
                          style: TextStyle(
                              color: const Color(0xFF0E6DFD),
                              fontSize: 16.0,
                              height: lineHeight(fontSize: 16.0, height: 18.0)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '-' + shopItem.discount,
                          style: TextStyle(
                              color: const Color(0xFF0E6DFD),
                              fontSize: 16.0,
                              height: lineHeight(fontSize: 16.0, height: 18.0)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text('Total:',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                height:
                                    lineHeight(fontSize: 16.0, height: 18.0)),
                            textAlign: TextAlign.right),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(shopItem.total,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                height:
                                    lineHeight(fontSize: 16.0, height: 18.0)),
                            textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TableCell tableHeader(String title, [TextAlign align = TextAlign.center]) {
    return TableCell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(title,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: lineHeight(fontSize: 16.0, height: 18.0)),
                textAlign: align),
          ),
        ],
      ),
    );
  }

  TableRow listItem(CartItemStore cartItem) {
    final style = TextStyle(
        fontSize: 14.0, height: lineHeight(fontSize: 14.0, height: 16.0));
    final promotionsStyle = TextStyle(
        fontSize: 14.0,
        height: lineHeight(fontSize: 14.0, height: 16.0),
        color: const Color(0xFF0E6DFD));

    return TableRow(
      children: [
        // Quantity
        Text(cartItem.quantity.toString(),
            style: style, textAlign: TextAlign.center),
        // Product
        Text(cartItem.item.name, style: style, textAlign: TextAlign.center),
        // Unit price
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(cartItem.item.unitPriceFormatted,
                style: style, textAlign: TextAlign.right),
            Visibility(
                visible: cartItem.showBasePriceWhenHasDiscount,
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
                visible: cartItem.showBasePriceWhenHasDiscount,
                child: Text('-' + cartItem.discountQuantity.toString(),
                    style: promotionsStyle, textAlign: TextAlign.right))
          ],
        )
      ],
    );
  }
}
