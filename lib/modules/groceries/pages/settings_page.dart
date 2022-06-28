import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:money_manager/modules/groceries/stores/settings_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static late SettingsStore _settingsStore;

  @override
  Widget build(BuildContext context) {
    _settingsStore = Provider.of<SettingsStore>(context);

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
              Observer(
                builder: (_) => SwitchListTile(
                    title: const Text('Modo oscuro'),
                    value: _settingsStore.darkMode,
                    onChanged: (value) => _settingsStore.setDarkMode(value)),
              )
            ],
          )
        ],
      ),
    );
  }
}
