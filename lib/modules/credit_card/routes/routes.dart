import 'package:flutter/material.dart';
import 'package:money_manager/modules/credit_card/main_credit_cards_page.dart';
import 'package:money_manager/modules/credit_card/pages/create_credit_card_page.dart';

final creditCardRoutes = <String, Widget Function(BuildContext)>{
  'credit_card': (_) => const MainCreditCardPage(),
  'credit_card/create': (_) => const CreateCreditCardPage()
};
