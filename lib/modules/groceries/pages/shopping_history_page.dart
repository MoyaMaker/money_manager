import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/pages/shopping_detail_page.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_history_store.dart';
import 'package:money_manager/utils/font_height.dart';

class GroceriesShoppingHistoryPage extends StatelessWidget {
  const GroceriesShoppingHistoryPage({Key? key}) : super(key: key);

  static final _shoppingHistoryStore = ShoppingHistoryStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text('Historial de compras'),
        ),
        body: ListView.builder(
            itemCount: _shoppingHistoryStore.countItems,
            itemBuilder: (_, int index) => Observer(
                builder: (_) => historyItem(
                    context, _shoppingHistoryStore.shopItems[index]))));
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
            const Icon(Icons.keyboard_arrow_right, color: Colors.blue)
          ],
        ),
      ),
    );
  }
}
