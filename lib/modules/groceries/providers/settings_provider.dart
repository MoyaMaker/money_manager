import 'package:hive_flutter/hive_flutter.dart';

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

  Future<void> setDarkMode(bool value) {
    return _box.put('darkMode', value);
  }

  bool get darkMode => _box.get('darkMode', defaultValue: false);
}
