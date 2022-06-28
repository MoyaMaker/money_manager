import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/modules/groceries/stores/settings/theme_mode_store.dart';

class SettingsProvider {
  late Box _box;

  SettingsProvider() {
    init();
  }

  Future<void> init() async {
    const boxName = 'settings';
    if (Hive.isBoxOpen(boxName)) {
      _box = Hive.box(boxName);
    } else {
      _box = await Hive.openBox(boxName);
    }
  }

  Future<void> setThemeModeAppearance(ThemeModeAppearance mode) =>
      _box.put('themeModeAppearance', mode);

  ThemeModeAppearance get themeModeAppearance =>
      _box.get('themeModeAppearance', defaultValue: ThemeModeAppearance.system);
}
