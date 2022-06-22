import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/models/backup_model.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';

part 'security_copy_store.g.dart';

class SecurityCopyStore extends _SecurityCopyStore with _$SecurityCopyStore {
  SecurityCopyStore(
      {required ProductListStore productListStore,
      required ReceiptHistoryStore receiptHistoryStore})
      : super(
            productListStore: productListStore,
            receiptHistoryStore: receiptHistoryStore);
}

abstract class _SecurityCopyStore with Store {
  final ProductListStore productListStore;
  final ReceiptHistoryStore receiptHistoryStore;

  _SecurityCopyStore(
      {required this.productListStore, required this.receiptHistoryStore});

  @computed
  String get backupJsonString =>
      BackupModel(productListStore.products, receiptHistoryStore.shoppedItems)
          .toString();

  @action
  String _fileName() {
    final date = DateTime.now();

    final day = '${date.day > 10 ? date.day : '0${date.day}'}';
    final month = '${date.month > 10 ? date.month : '0${date.month}'}';

    return '$day$month${date.year}_${date.millisecondsSinceEpoch}_backup_money_manager.json';
  }

  @action
  Future<File?> downloadCopyFile() async {
    final dir = await Directory.systemTemp.createTemp();

    File jsonFile = File('${dir.path}/$_fileName()');

    try {
      final file = await jsonFile.writeAsString(backupJsonString);

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
}
