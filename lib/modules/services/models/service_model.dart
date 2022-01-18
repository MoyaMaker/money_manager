import 'package:intl/intl.dart';

class ServiceModel {
  final String name;
  final double price;
  // On per year, every month, 15 days or week
  final PeriodPayment periodPayment;
  // Year: If it's this ask for date of the year
  // Month: Which date
  // 15 days: Ask for the current payment day
  // Week: which day should pay (example: on friday)
  final int paymentDay;
  final int? paymentMonth;
  final String category;

  ServiceModel(
      {required this.name,
      required this.price,
      required this.periodPayment,
      required this.paymentDay,
      this.paymentMonth,
      required this.category});

  String get priceFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(price);
}

enum PeriodPayment { year, month }

extension PeriodPaymentExtension on PeriodPayment {
  String get displayText {
    switch (this) {
      case PeriodPayment.year:
        return 'Anual';
      case PeriodPayment.month:
        return 'Mensual';
      default:
        return '';
    }
  }
}

class Category {
  final String name;

  Category({required this.name});
}
