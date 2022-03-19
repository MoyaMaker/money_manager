import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/credit_card/stores/credit_card_store.dart';
import 'package:provider/provider.dart';

import '../stores/create_credit_card_store.dart';

class CreateCreditCardPage extends StatelessWidget {
  const CreateCreditCardPage({Key? key}) : super(key: key);

  static final _formStore = CreateCreditCardStore();
  static late CreditCardListStore _creditCardStore;

  // Controllers
  static late FocusNode _nameFocusNode;
  static late FocusNode _creditLimitFocusNode;
  static late FocusNode _dueDateFocusNode;
  static late FocusNode _paymentDateFocusNode;

  @override
  Widget build(BuildContext context) {
    _creditCardStore = Provider.of<CreditCardListStore>(context, listen: false);

    _nameFocusNode = FocusNode();
    _creditLimitFocusNode = FocusNode();
    _dueDateFocusNode = FocusNode();
    _paymentDateFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva tarjeta'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Name
            Observer(
              builder: (_) => TextFormField(
                focusNode: _nameFocusNode,
                decoration: InputDecoration(
                    labelText: 'Nombre tarjeta',
                    errorText: _formStore.error.cardName),
                onChanged: (String value) => _formStore.setCardName(value),
              ),
            ),

            // Amount
            Observer(
              builder: (_) => TextFormField(
                focusNode: _creditLimitFocusNode,
                decoration: InputDecoration(
                    labelText: 'Límite de crédito',
                    errorText: _formStore.error.creditLimit),
                onChanged: (String value) => _formStore.setCreditLimit(value),
              ),
            ),

            // Due date
            Observer(
              builder: (_) => TextFormField(
                focusNode: _dueDateFocusNode,
                decoration: InputDecoration(
                    labelText: 'Día de corte',
                    errorText: _formStore.error.dueDate),
                onChanged: (String value) => _formStore.setDueDate(value),
              ),
            ),

            // Limit day of payment
            Observer(
              builder: (_) => TextFormField(
                focusNode: _paymentDateFocusNode,
                decoration: InputDecoration(
                    labelText: 'Fecha límite de pago',
                    errorText: _formStore.error.paymentLimitDate),
                onChanged: (String value) =>
                    _formStore.setPaymentLimitDate(value),
              ),
            ),

            // Button
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                  onPressed: () {
                    _formStore.validateAll();

                    if (_formStore.canSave) {
                      final card = _formStore.creditCard;

                      _creditCardStore.add(card);

                      Navigator.pop(context);
                    } else if (_formStore.error.cardName != null) {
                      _nameFocusNode.requestFocus();
                    } else if (_formStore.error.creditLimit != null) {
                      _creditLimitFocusNode.requestFocus();
                    } else if (_formStore.error.dueDate != null) {
                      _dueDateFocusNode.requestFocus();
                    } else if (_formStore.error.paymentLimitDate != null) {
                      _paymentDateFocusNode.requestFocus();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: double.infinity,
                        child: Text('Añadir',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center)),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
