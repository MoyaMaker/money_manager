import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/create_credit_card_store.dart';

class CreateCreditCardPage extends StatelessWidget {
  const CreateCreditCardPage({Key? key}) : super(key: key);

  static final store = CreateCreditCardStore();

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                    labelText: 'Nombre tarjeta',
                    errorText: store.error.cardName),
                onChanged: (String value) => store.setCardName(value),
              ),
            ),

            // Amount
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                    labelText: 'Límite de crédito',
                    errorText: store.error.creditLimit),
                onChanged: (String value) => store.setCreditLimit(value),
              ),
            ),

            // Due date
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                    labelText: 'Día de corte', errorText: store.error.dueDate),
                onChanged: (String value) => store.setDueDate(value),
              ),
            ),

            // Limit day of payment
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                    labelText: 'Fecha límite de pago',
                    errorText: store.error.paymentLimitDate),
                onChanged: (String value) => store.setPaymentLimitDate(value),
              ),
            ),

            // Button
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                  onPressed: () {
                    store.validateAll();

                    if (!store.error.hasErrors) {
                      // Save credit card
                      // Pop
                    } else {
                      // Set focus on input error
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
