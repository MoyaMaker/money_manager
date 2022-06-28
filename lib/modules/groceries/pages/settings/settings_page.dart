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
                leading: Icon(Icons.restore,
                    color: Theme.of(context).colorScheme.primary,
                    semanticLabel: 'Backup router'),
                title: const Text('Respaldo'),
                trailing: Icon(Icons.chevron_right,
                    color: Theme.of(context).colorScheme.primary),
                onTap: () => Navigator.pushNamed(
                    context, 'groceries/configuration/backup'),
              ),
              ListTile(
                leading: Icon(Icons.color_lens,
                    color: Theme.of(context).colorScheme.primary,
                    semanticLabel: 'Appearance'),
                title: const Text('Apariencia'),
                trailing: Icon(Icons.chevron_right,
                    color: Theme.of(context).colorScheme.primary),
                onTap: () => Navigator.pushNamed(
                    context, 'groceries/configuration/theme-mode'),
              )
            ],
          )
        ],
      ),
    );
  }
}
