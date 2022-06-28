import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:money_manager/modules/groceries/stores/settings/theme_mode_store.dart';

class ThemeModePage extends StatelessWidget {
  const ThemeModePage({Key? key}) : super(key: key);

  static late ThemeModeStore _themeModeStoreStore;

  @override
  Widget build(BuildContext context) {
    _themeModeStoreStore = Provider.of<ThemeModeStore>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Respaldo')),
        body: Observer(
          builder: (_) => ListView(
            children: [
              RadioListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: Icon(Icons.phone_android,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(ThemeModeAppearance.system.name),
                  value: ThemeModeAppearance.system,
                  groupValue: _themeModeStoreStore.themeMode,
                  onChanged: (ThemeModeAppearance? value) =>
                      _themeModeStoreStore.setThemeModeAppearance(value!)),
              RadioListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: Icon(Icons.dark_mode,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(ThemeModeAppearance.dark.name),
                  value: ThemeModeAppearance.dark,
                  groupValue: _themeModeStoreStore.themeMode,
                  onChanged: (ThemeModeAppearance? value) =>
                      _themeModeStoreStore.setThemeModeAppearance(value!)),
              RadioListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: Icon(Icons.light_mode,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(ThemeModeAppearance.light.name),
                  value: ThemeModeAppearance.light,
                  groupValue: _themeModeStoreStore.themeMode,
                  onChanged: (ThemeModeAppearance? value) =>
                      _themeModeStoreStore.setThemeModeAppearance(value!))
            ],
          ),
        ));
  }
}
