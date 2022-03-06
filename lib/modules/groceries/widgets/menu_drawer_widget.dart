import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Despensa'),
            onTap: () {
              print(getActualRoute(context));
              Navigator.pop(context);
              Navigator.pushNamed(context, 'groceries');
            },
          ),
          ListTile(
            title: const Text('Tarjetas de crédito'),
            onTap: () {
              print(getActualRoute(context));
              Navigator.pop(context);
              Navigator.pushNamed(context, 'credit-card');
            },
          ),
        ],
      ),
    );
  }

  String? getActualRoute(BuildContext context) {
    return ModalRoute.of(context)!.settings.name;
  }
}
