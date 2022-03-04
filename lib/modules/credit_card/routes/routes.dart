import 'package:flutter/material.dart';
import 'package:money_manager/modules/credit_card/main_credit_cards_page.dart';

final creditCardRoutes = <String, Widget Function(BuildContext)>{
  'credit-card': (_) => const MainCreditCardPage(),
};
