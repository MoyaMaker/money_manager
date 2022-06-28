import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/settings_store.dart';
import 'package:money_manager/theme/theme_data_custom.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes.dart';
import 'config/hive_config.dart';
import 'config/providers_config.dart';

void main() async {
  await hiveConfig();

  runApp(const MoneyManagerApp());
}

class MoneyManagerApp extends StatefulWidget {
  const MoneyManagerApp({Key? key}) : super(key: key);

  @override
  State<MoneyManagerApp> createState() => _MoneyManagerAppState();
}

class _MoneyManagerAppState extends State<MoneyManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<SettingsStore>(
        builder: (context, store, child) => Observer(
          builder: (_) => MaterialApp(
            title: 'Money Manager',
            themeMode: store.darkMode ? ThemeMode.dark : ThemeMode.light,
            // darkTheme: ThemeDataCustom.darkTheme,
            darkTheme: ThemeData.dark(),
            // theme: ThemeDataCustom.lightTheme,
            theme: ThemeData.light(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('es', ''),
            ],
            initialRoute: 'groceries',
            routes: mainRoutes,
          ),
        ),
      ),
    );
  }
}
