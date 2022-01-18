import 'package:flutter/material.dart';
import 'package:money_manager/modules/accounts/models/account_model.dart';

class AccountDetailPage extends StatelessWidget {
  final Account account;

  const AccountDetailPage({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(account.name),
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
              text: TextSpan(
                  text: 'Saldo disponible: ',
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                TextSpan(
                    text: account.amountFormatted,
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ]))),
    );
  }
}
