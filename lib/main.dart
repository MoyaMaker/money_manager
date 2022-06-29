import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes.dart';
import 'config/hive_config.dart';
import 'config/providers_config.dart';

import 'package:money_manager/theme/theme_data_custom.dart';
import 'package:money_manager/modules/groceries/stores/settings/theme_mode_store.dart';

void main() async {
  await hiveConfig();

  runApp(const MoneyManagerApp());
}

class MoneyManagerApp extends StatelessWidget {
  const MoneyManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeModeStore>(
        builder: (_, store, __) => Observer(
            builder: (_) => MaterialApp(
                title: 'Money Manager',
                themeMode: store.themeMode.value,
                darkTheme: ThemeDataCustom.darkTheme,
                theme: ThemeDataCustom.lightTheme,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [Locale('en', ''), Locale('es', '')],
                initialRoute: 'groceries',
                routes: mainRoutes)),
      ),
    );
  }
}
