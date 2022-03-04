import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes.dart';
import 'config/hive_config.dart';
import 'config/providers_config.dart';

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
      child: MaterialApp(
        title: 'Money Manager',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                foregroundColor: Colors.black,
                backgroundColor: Color(0xFFFAFAFA),
                elevation: 0.0)),
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
    );
  }
}
