import 'package:flutter/material.dart';

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
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Nombre tarjeta', errorText: store.error.cardName),
              onChanged: (String value) => store.setCardName(value),
            ),

            // Amount
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Límite de crédito',
                  errorText: store.error.creditLimit),
              onChanged: (String value) => store.setCreditLimit(value),
            ),

            // Due date
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Día de corte', errorText: store.error.dueDate),
              onChanged: (String value) => store.setDueDate(value),
            ),

            // Limit day of payment
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Fecha límite de pago',
                  errorText: store.error.paymentLimitDate),
              onChanged: (String value) => store.setPaymentLimitDate(value),
            ),
          ],
        ),
      )),
    );
  }
}
