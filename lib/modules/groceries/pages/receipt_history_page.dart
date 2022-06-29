import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:money_manager/utils/font_height.dart';
import 'package:money_manager/modules/groceries/models/receipt_model.dart';
import 'package:money_manager/modules/groceries/pages/receipt_detail_page.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';

class ReceiptHistoryPage extends StatelessWidget {
  const ReceiptHistoryPage({Key? key}) : super(key: key);

  static late ReceiptHistoryStore _receiptHistoryStore;

  @override
  Widget build(BuildContext context) {
    _receiptHistoryStore =
        Provider.of<ReceiptHistoryStore>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Historial de compras'),
        ),
        body: Observer(builder: (_) => listItems(context)));
  }

  Widget listItems(BuildContext context) {
    if (!_receiptHistoryStore.hasItems) {
      return const Center(child: Text('No hay registros de compras'));
    }

    return ListView.builder(
        itemCount: _receiptHistoryStore.countItems,
        itemBuilder: (_, int index) => Observer(
            builder: (_) => historyItem(
                context, _receiptHistoryStore.shoppedItems[index])));
  }

  Widget historyItem(BuildContext context, Receipt receipt) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ReceiptDetailPage(
                  receipt: receipt,
                  receiptHistoryStore: _receiptHistoryStore))),
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
                Text(receipt.buyDateFormatted,
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        height: 1.0)),
                Text(receipt.storeName,
                    style: TextStyle(
                        fontSize: 14.0,
                        height: lineHeight(fontSize: 14.0, height: 16.0)))
              ],
            ),

            // Total
            Text(receipt.total,
                style: TextStyle(
                    fontSize: 14.0,
                    height: lineHeight(fontSize: 14.0, height: 16.0))),

            // Icon
            Icon(Icons.keyboard_arrow_right,
                color: Theme.of(context).colorScheme.primary)
          ],
        ),
      ),
    );
  }
}
