import 'dart:io';
import 'dart:convert';
import 'package:mobx/mobx.dart';

import 'package:money_manager/modules/groceries/models/backup_model.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';

part 'backup_store.g.dart';

class BackupStore extends _BackupStore with _$BackupStore {
  BackupStore(
      {required ProductListStore productListStore,
      required ReceiptHistoryStore receiptHistoryStore})
      : super(
            productListStore: productListStore,
            receiptHistoryStore: receiptHistoryStore);
}

abstract class _BackupStore with Store {
  final ProductListStore productListStore;
  final ReceiptHistoryStore receiptHistoryStore;

  _BackupStore(
      {required this.productListStore, required this.receiptHistoryStore}) {
    _disposers = [];
  }

  late List<ReactionDisposer> _disposers;

  @computed
  String get securityBackupJsonString =>
      BackupModel(productListStore.products, receiptHistoryStore.shoppedItems)
          .toString();

  @action
  String _securityBackupFileName() {
    final date = DateTime.now();

    final day = '${date.day > 10 ? date.day : '0${date.day}'}';
    final month = '${date.month > 10 ? date.month : '0${date.month}'}';

    return '$day$month${date.year}_${date.millisecondsSinceEpoch}_backup_money_manager.json';
  }

  @action
  Future<File?> exportSecurityBackup() async {
    try {
      final dir = await Directory.systemTemp.createTemp();

      File jsonFile = File('${dir.path}/${_securityBackupFileName()}');

      final file = await jsonFile.writeAsString(securityBackupJsonString);

      return file;
    } catch (e) {
      return null;
    }
  }

  @action
  Future<void> restoreBackupFile(File backupFile) async {
    final backup = await backupFile.readAsString();

    final decodedFile = jsonDecode(backup);

    final backupModel = BackupModel.fromJson(decodedFile);

    productListStore.restoreProducts(backupModel.productList);

    receiptHistoryStore.restoreReceipts(backupModel.receiptHistory);
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}
