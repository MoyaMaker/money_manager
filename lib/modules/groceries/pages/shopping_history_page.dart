import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceriesShoppingHistoryPage extends StatelessWidget {
  const GroceriesShoppingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text('Historial de compras'),
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, int index) {
              return ListTile(
                title: Text('0${index + 1} diciembre 2021'),
                subtitle: const Text('Soriana'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () =>
                    Navigator.pushNamed(context, 'groceries/shopping-detail'),
              );
            }));
  }
}
