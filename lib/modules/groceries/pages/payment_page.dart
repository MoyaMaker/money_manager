import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/modules/groceries/stores/payment_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class GroceriesPaymentPage extends StatelessWidget {
  const GroceriesPaymentPage({Key? key}) : super(key: key);

  static late ShoppingCartStore _shoppingCartStore;
  static late ReceiptHistoryStore _receiptHistoryStore;
  static late ProductListStore _productListStore;
  static late PaymentStore _paymentStore;

  static late TextEditingController _storeNameController;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    _receiptHistoryStore =
        Provider.of<ReceiptHistoryStore>(context, listen: false);
    _productListStore = Provider.of<ProductListStore>(context, listen: false);
    _paymentStore = PaymentStore(
        productListStore: _productListStore,
        receiptHistoryStore: _receiptHistoryStore,
        shoppingCartStore: _shoppingCartStore);

    _storeNameController =
        TextEditingController(text: _shoppingCartStore.storeName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Select date
            _getDatePickerEnabled(context),

            // Store name
            TextField(
              autofocus: true,
              controller: _storeNameController,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (String value) =>
                  _shoppingCartStore.setStoreName(value),
              decoration: const InputDecoration(hintText: 'Nombre de tienda'),
            ),

            // Total
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Text(_shoppingCartStore.total,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Button save
            Observer(
              builder: (_) => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0)),
                    onPressed: _shoppingCartStore.canContinueBuy
                        ? () {
                            _paymentStore.createReceipt();
                            // Clear inputs
                            _storeNameController.clear();

                            Navigator.pushNamedAndRemoveUntil(
                                context, 'groceries', (route) => false);
                          }
                        : null,
                    child: const Text('Guardar',
                        style: TextStyle(fontSize: 18.0))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getDatePickerEnabled(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Observer(
        builder: (_) => InputDecorator(
          decoration: const InputDecoration(labelText: 'Fecha', enabled: true),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                DateFormat('dd MMMM yyyy', 'es_MX')
                    .format(_shoppingCartStore.buyDate),
              ),
              Icon(Icons.arrow_drop_down,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade700
                      : Colors.white70),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        locale: const Locale('es'),
        context: context,
        initialDate: _shoppingCartStore.buyDate,
        firstDate: DateTime(2015),
        lastDate: DateTime.now());
    if (picked != null) {
      _shoppingCartStore.setBuyDate(picked);
    }
  }
}
