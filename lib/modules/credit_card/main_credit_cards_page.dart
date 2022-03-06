import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/widgets/menu_drawer_widget.dart';

class MainCreditCardPage extends StatelessWidget {
  const MainCreditCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas'),
      ),
      drawer: const MenuDrawer(),
      body: Column(
        children: const [],
      ),
    );
  }
}
