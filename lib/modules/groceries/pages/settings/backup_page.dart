import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';

import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';
import 'package:money_manager/modules/groceries/stores/settings/backup_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({Key? key}) : super(key: key);

  static late ProductListStore _productListStore;
  static late ReceiptHistoryStore _receiptHistoryStore;
  static late BackupStore _backupStore;

  @override
  Widget build(BuildContext context) {
    _productListStore = Provider.of<ProductListStore>(context, listen: false);
    _receiptHistoryStore =
        Provider.of<ReceiptHistoryStore>(context, listen: false);

    _backupStore = BackupStore(
        productListStore: _productListStore,
        receiptHistoryStore: _receiptHistoryStore);
    return Scaffold(
      appBar: AppBar(title: const Text('Respaldo')),
      body: Stack(
        children: [
          ListView(
            children: [
              ListTile(
                leading: Icon(Icons.file_copy,
                    color: Theme.of(context).colorScheme.primary,
                    semanticLabel: 'Security backup'),
                title: const Text('Copia de seguridad'),
                onTap: () async {
                  final file = await _backupStore.exportSecurityBackup();

                  if (file != null) {
                    final date = DateTime.now();
                    Share.shareFiles([file.path],
                        text: 'Backup ${date.day} ${date.month} ${date.year}');
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                              title: Text('No se ha generado el archivo'),
                            ));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.restart_alt,
                    color: Theme.of(context).colorScheme.primary,
                    semanticLabel: 'Restore backup'),
                title: const Text('Restaurar copia de seguridad'),
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom, allowedExtensions: ['json']);

                  final file = File(result!.files.first.path!);

                  // Validate file, must have key products and receipt_history
                  // Show the dialog when some of this is missing
                  if (!await _backupStore.isValidFile(file)) {
                    showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                            title: Icon(Icons.error,
                                size: 55.0, color: Colors.red),
                            content: Text(
                                'El archivo no cumple con los requisitos de formato',
                                style: TextStyle(fontSize: 24.0),
                                textAlign: TextAlign.center)));
                    return;
                  }

                  final resultRestore =
                      await _backupStore.restoreBackupFile(file);

                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Icon(Icons.check,
                                color: Colors.green, size: 55.0),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                      'Se ha restaurado la copia de seguridad',
                                      style: TextStyle(fontSize: 24.0),
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 15.0),
                                  Text(
                                      '${resultRestore.productsAdded} de ${resultRestore.productsLoaded} productos restaurados',
                                      style: const TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 15.0),
                                  Text(
                                      '${resultRestore.receiptsAdded} de ${resultRestore.receiptsLoaded} recibos restaurados',
                                      style: const TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center)
                                ]),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Entendido'))
                            ],
                          ));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
