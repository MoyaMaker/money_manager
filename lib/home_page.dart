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
            leading: const Icon(Icons.create),
            title: const Text('Registro de gastos'),
            onTap: () => Navigator.pushNamed(context, 'expenses'),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Cuentas'),
            onTap: () => Navigator.pushNamed(context, 'accounts'),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Servicios'),
            onTap: () => Navigator.pushNamed(context, 'services'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Despensa'),
            onTap: () => Navigator.pushNamed(context, 'groceries'),
          ),
          ListTile(
            leading: const Icon(Icons.local_restaurant),
            title: const Text('Recetas'),
            onTap: () => Navigator.pushNamed(context, 'recipes'),
          ),
        ],
      ),
    );
  }
}
