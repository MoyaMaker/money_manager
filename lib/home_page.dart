import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control de gastos')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Tarjeta de crédito'),
            onTap: () => Navigator.pushNamed(context, 'credit-card'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Despensa'),
            onTap: () => Navigator.pushNamed(context, 'groceries'),
          ),
        ],
      ),
    );
  }
}
