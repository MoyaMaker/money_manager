import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/providers/settings_provider.dart';

part 'theme_mode_store.g.dart';

class ThemeModeStore extends _ThemeModeStore with _$ThemeModeStore {}

abstract class _ThemeModeStore with Store {
  _ThemeModeStore() {
    _disposers = [
      autorun((_) async {
        await _settingsProvider.init();

        themeMode = _settingsProvider.themeModeAppearance;
      })
    ];
  }

  late List<ReactionDisposer> _disposers;

  final _settingsProvider = SettingsProvider();

  @observable
  ThemeModeAppearance themeMode = ThemeModeAppearance.system;

  @action
  void setThemeModeAppearance(ThemeModeAppearance value) {
    themeMode = value;

    _settingsProvider.setThemeModeAppearance(value);
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}

@HiveType(typeId: 5, adapterName: 'ThemeModeAdapter')
enum ThemeModeAppearance {
  @HiveField(0)
  system,
  @HiveField(1)
  dark,
  @HiveField(2)
  light
}

extension ThemeModeAppearanceExtension on ThemeModeAppearance {
  String get name {
    switch (this) {
      case ThemeModeAppearance.dark:
        return "Oscuro";
      case ThemeModeAppearance.light:
        return "Claro";
      case ThemeModeAppearance.system:
      default:
        return "Sistema";
    }
  }

  ThemeMode get value {
    switch (this) {
      case ThemeModeAppearance.dark:
        return ThemeMode.dark;
      case ThemeModeAppearance.light:
        return ThemeMode.light;
      case ThemeModeAppearance.system:
      default:
        return ThemeMode.system;
    }
  }
}
