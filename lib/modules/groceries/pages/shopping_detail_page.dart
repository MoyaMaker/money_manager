import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';

class GroceriesShoppingDetailPage extends StatelessWidget {
  const GroceriesShoppingDetailPage({Key? key}) : super(key: key);

  static final gItems = [
    GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
    GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5),
    GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0),
    GroceryItemStore(id: '4', name: 'Cereal', unitPrice: 65.0)
  ];

  @override
  Widget build(BuildContext context) {
    final itemsList = [
      CartItemStore(item: gItems[0], quantity: 1.0),
      CartItemStore(item: gItems[1], quantity: 0.3),
      CartItemStore(item: gItems[2], quantity: 3.0, promotion: Promotions.p3x2),
      CartItemStore(
          item: gItems[3],
          quantity: 2.0,
          promotion: Promotions.quantity4UniquePrice,
          discount: 85.0),
    ];
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Detalle de compra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Store name
            const Center(
              child: Text('Soriana',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 1.25)),
            ),
            // Buy date
            const Center(
                child: Text('02 marzo 2021',
                    style: TextStyle(fontSize: 14.0, height: 1.25))),
            // Products

            Expanded(
              child: Container(
                height: 100.0,
                margin: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    itemCount: itemsList.length,
                    itemBuilder: (_, int index) {
                      final item = itemsList[index];
                      return listItem(item);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(CartItemStore cartItem) {
    return Column(
      children: [
        // Main info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Item name and price
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.item.name,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  Text(cartItem.item.unitPriceFormatted)
                ],
              ),
            ),

            // Quantity
            Expanded(flex: 1, child: Text(cartItem.quantity.toString())),

            // Total
            Text(cartItem.totalFormatted)
          ],
        ),
        // Discount
        Visibility(
          visible: cartItem.basePriceWhenHasDiscount,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(cartItem.promotion!.value),
              const SizedBox(width: 20.0),
              Text('-' + cartItem.discountQuantity.toString()),
            ],
          ),
        )
      ],
    );
  }
}
