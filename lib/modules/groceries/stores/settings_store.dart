import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/providers/settings_provider.dart';

part 'settings_store.g.dart';

class SettingsStore extends _SettingsStore with _$SettingsStore {}

abstract class _SettingsStore with Store {
  _SettingsStore() {
    _disposers = [
      autorun((_) async {
        await _settingsProvider.init();

        darkMode = _settingsProvider.darkMode;
      })
    ];
  }

  late List<ReactionDisposer> _disposers;

  final _settingsProvider = SettingsProvider();

  @observable
  bool darkMode = false;

  @action
  void setDarkMode(bool value) {
    darkMode = value;

    _settingsProvider.setDarkMode(value);
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}
