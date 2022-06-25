import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';

import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';
import 'package:money_manager/modules/groceries/stores/security_copy_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        children: [
          // Show loader cover the screen when set a file into restore backup, observer for observable future
          ListTile(
            leading: const Icon(Icons.file_copy,
                color: Colors.blue, semanticLabel: 'Backup file'),
            title: const Text('Copia de seguridad'),
            onTap: () async {
              final file = await _backupStore.downloadCopyFile();

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
            leading: const Icon(Icons.restart_alt,
                color: Colors.blue, semanticLabel: 'Restore backup'),
            title: const Text('Restaurar copia de seguridad'),
            onTap: () {
              final result = FilePicker.platform.pickFiles(
                  type: FileType.custom, allowedExtensions: ['json']);

              _backupStore.setRestoreFileResult(result);

              // final result = FilePicker.platform.pickFiles(
              //     type: FileType.custom,
              //     allowedExtensions: ['json']).then((value) {
              //   if (value != null) {
              //     File file = File(value.files.first.path!);

              //     Navigator.pushNamed(
              //         context, 'groceries/configuration/backup-restore',
              //         arguments: BackupArguments(backupFile: file));
              //   }
              // });

              // if (result != null) {
              // File file = File(result.files.first.path!);

              // _securityCopyStore.restoreBackupFile(file);
              // }
            },
          )
        ],
      ),
    );
  }
}
