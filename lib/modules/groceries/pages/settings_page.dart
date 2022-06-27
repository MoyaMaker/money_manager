import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: Stack(
        children: [
          ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.restore,
                    color: Colors.blue, semanticLabel: 'Backup router'),
                title: const Text('Respaldo'),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () => Navigator.pushNamed(
                    context, 'groceries/configuration/backup'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
