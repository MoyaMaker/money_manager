import 'package:flutter/material.dart';
import 'package:money_manager/modules/expenses_control/models/expenses_control_model.dart';

class ExpensesControlPage extends StatelessWidget {
  const ExpensesControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses Control')),
      body: ListView.builder(
          itemCount: expensesControlList.length,
          itemBuilder: (_, index) {
            switch (expensesControlList[index].type) {
              case ExpenseType.transaction:
                return transactionWidget(expensesControlList[index]);
              case ExpenseType.expense:
              case ExpenseType.income:
              default:
                return expensesWidget(expensesControlList[index]);
            }
          }),
    );
  }

  Widget expensesWidget(ExpensesControlModel expenseData) {
    return ListTile(
      leading: Text(expenseData.dateFormatted),
      title: Text(expenseData.description),
      subtitle: Text(expenseData.account),
      trailing: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: expenseData.type.getBackgroundColor,
              borderRadius: BorderRadius.circular(15.0)),
          child: Text(expenseData.amountFormatted,
              style: TextStyle(color: expenseData.type.getColor))),
    );
  }

  Widget transactionWidget(ExpensesControlModel transaction) {
    return ListTile(
      leading: Text(transaction.dateFormatted),
      title: Text('${transaction.account} -> ${transaction.accountDestiny}'),
      trailing: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: transaction.type.getBackgroundColor,
              borderRadius: BorderRadius.circular(15.0)),
          child: Text(transaction.amountFormatted,
              style: TextStyle(color: transaction.type.getColor))),
    );
  }
}

final expensesControlList = [
  ExpensesControlModel(
      description: '',
      account: 'BBVA',
      accountDestiny: 'Cartera',
      amount: 500.0,
      type: ExpenseType.transaction),
  ExpensesControlModel(
      description: 'Carl\'s JR',
      account: 'BBVA',
      amount: 523.0,
      type: ExpenseType.expense),
  ExpensesControlModel(
      description: 'Salario',
      account: 'BBVA',
      type: ExpenseType.income,
      amount: 8000.0),
  ExpensesControlModel(
      description: 'Soriana',
      account: 'BBVA',
      amount: 328.0,
      type: ExpenseType.expense),
];
