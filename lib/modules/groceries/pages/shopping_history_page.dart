import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/pages/shopping_detail_page.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/utils/font_height.dart';

class GroceriesShoppingHistoryPage extends StatelessWidget {
  const GroceriesShoppingHistoryPage({Key? key}) : super(key: key);

  static final _staticCartItems = [
    ShoppingCartStore(
        id: '1',
        buyDate: DateTime.now(),
        storeName: 'Soriana',
        items: ObservableList<CartItemStore>.of([
          CartItemStore(
              item: GroceryItemStore(id: '0', name: 'Cereal', unitPrice: 56.0),
              quantity: 2.0,
              promotion: Promotions.p2x1),
          CartItemStore(
              item: GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
              quantity: 1.0),
          CartItemStore(
              item:
                  GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5),
              quantity: 1.0),
          CartItemStore(
              item: GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0),
              quantity: 1.0),
          CartItemStore(
              item: GroceryItemStore(id: '4', name: 'Cereal', unitPrice: 65.0),
              quantity: 1.0),
        ]))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text('Historial de compras'),
        ),
        body: ListView.builder(
            itemCount: _staticCartItems.length,
            itemBuilder: (_, int index) => Observer(
                builder: (_) =>
                    historyItem(context, _staticCartItems[index]))));
  }

  Widget historyItem(BuildContext context, ShoppingCartStore cartItem) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => GroceriesShoppingDetailPage(shopItem: cartItem))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xFFB8B8B8)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Date &
            // Store name
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.buyDateFormatted,
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        height: 1.0)),
                Text(cartItem.storeName,
                    style: TextStyle(
                        fontSize: 14.0,
                        height: lineHeight(fontSize: 14.0, height: 16.0),
                        color: const Color(0xFF636E72)))
              ],
            ),

            // Total
            Text(cartItem.total,
                style: TextStyle(
                    fontSize: 14.0,
                    height: lineHeight(fontSize: 14.0, height: 16.0),
                    color: const Color(0xFF636E72))),

            // Icon
            const Icon(Icons.keyboard_arrow_right, color: Color(0xFF636E72))
          ],
        ),
      ),
    );
  }
}
