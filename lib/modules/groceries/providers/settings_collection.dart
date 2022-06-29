import 'package:hive_flutter/hive_flutter.dart';

import 'package:money_manager/modules/groceries/stores/settings/theme_mode_store.dart';

class SettingsCollection {
  late Box _box;

  static String boxName = 'settings';

  SettingsCollection() {
    _box = Hive.box(boxName);
  }

  Future<void> setThemeModeAppearance(ThemeModeAppearance mode) =>
      _box.put('themeModeAppearance', mode);

  ThemeModeAppearance get themeModeAppearance =>
      _box.get('themeModeAppearance', defaultValue: ThemeModeAppearance.system);
}
