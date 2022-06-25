import 'dart:io';

import 'package:flutter/material.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({Key? key}) : super(key: key);

  static late BackupArguments args;

  @override
  Widget build(BuildContext context) {
    args = _extractArguments(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Configuración')),
        body: Column(
          children: const [
            Text('Productos añadidos:'),
            Text('6 productos añadidos'),
            Text('Registros de compras'),
            Text('2 registros añadidos'),
          ],
        ));
  }

  BackupArguments _extractArguments(BuildContext context) {
    final modalRoute = ModalRoute.of(context);

    if (modalRoute?.settings.arguments != null) {
      return modalRoute!.settings.arguments as BackupArguments;
    }

    return BackupArguments();
  }
}

class BackupArguments {
  final File? backupFile;

  BackupArguments({this.backupFile});
}
