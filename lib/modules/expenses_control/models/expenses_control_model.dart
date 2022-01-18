import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesControlModel {
  String description;
  String account;
  String? accountDestiny;
  double amount;
  ExpenseType type;
  late DateTime date;

  ExpensesControlModel(
      {required this.description,
      required this.account,
      this.accountDestiny,
      required this.type,
      required this.amount,
      date})
      : date = DateTime.now();

  String get amountFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(amount);

  String get dateFormatted {
    final day = date.day > 10 ? date.day : '0${date.day}';
    final month = date.month > 10 ? date.month : '0${date.month}';
    return '$day $month ${date.year}';
  }
}

enum ExpenseType { income, expense, transaction }

extension ExpenseTypeExtension on ExpenseType {
  String get displayText {
    switch (this) {
      case ExpenseType.expense:
        return 'Gasto';
      case ExpenseType.income:
        return 'Ingreso';
      case ExpenseType.transaction:
        return 'Transferencia';
      default:
        return '';
    }
  }

  Color get getBackgroundColor {
    switch (this) {
      case ExpenseType.expense:
        return Colors.red;
      case ExpenseType.income:
        return Colors.green;
      case ExpenseType.transaction:
      default:
        return Colors.grey;
    }
  }

  Color get getColor {
    switch (this) {
      // return Colors.black;
      case ExpenseType.income:
      case ExpenseType.expense:
      case ExpenseType.transaction:
      default:
        return Colors.white;
    }
  }
}
