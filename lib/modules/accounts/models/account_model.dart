import 'package:intl/intl.dart';

class Account {
  final String id;
  final String name;
  final double amount;

  Account({required this.id, required this.name, required this.amount});

  String get amountFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(amount);
}
