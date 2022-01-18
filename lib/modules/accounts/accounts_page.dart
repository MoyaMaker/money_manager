import 'package:flutter/material.dart';
import 'package:money_manager/modules/accounts/models/account_model.dart';
import 'package:money_manager/modules/accounts/pages/account_detail_page.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Accounts'),
        ),
        body: ListView.builder(
            itemCount: accountList.length,
            itemBuilder: (_, int index) =>
                accountItem(context, accountList[index])));
  }

  Widget accountItem(BuildContext context, Account account) {
    return ListTile(
        title: Text(account.name),
        trailing: Text(account.amountFormatted),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AccountDetailPage(account: account))));
  }
}

final accountList = [
  Account(id: '1', name: 'BBVA', amount: 120.5),
  Account(id: '2', name: 'Banco Azteca', amount: 325.2),
  Account(id: '3', name: 'Hey Banco', amount: 432.1),
  Account(id: '4', name: 'MercadoPago', amount: 398.0),
];
