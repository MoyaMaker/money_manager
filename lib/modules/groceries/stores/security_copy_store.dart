import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/models/receipt_model.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';

part 'security_copy_store.g.dart';

class SecurityCopyStore = _SecurityCopyStore with _$SecurityCopyStore;

abstract class _SecurityCopyStore with Store {
  final ProductListStore productListStore;
  final ReceiptHistoryStore receiptHistoryStore;

  _SecurityCopyStore(
      {required this.productListStore, required this.receiptHistoryStore});

  @computed
  Map<String, dynamic> get securityCopyJson =>
      BackupModel(productListStore.products, receiptHistoryStore.shoppedItems)
          .toJson();

  @action
  Future<File?> downloadCopyFile() async {
    final dir = await Directory.systemTemp.createTemp();
    File jsonFile = File(
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_app_security_copy.json');

    try {
      final file = await jsonFile.writeAsString(securityCopyJson.toString());

      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @action
  restoreBackupFile(File backupFile) async {
    final backup = await backupFile.readAsString();

    final decodedFile = jsonDecode(backup);

    final backupModel = BackupModel.fromJson(decodedFile);

    productListStore.restoreProducts(backupModel.productList);

    receiptHistoryStore.restoreReceipts(backupModel.receiptHistory);
  }
}

@JsonSerializable()
class BackupModel {
  final List<ProductStore> productList;

  final List<Receipt> receiptHistory;

  BackupModel(this.productList, this.receiptHistory);

  factory BackupModel.fromJson(Map<String, dynamic> json) =>
      _$BackupModelFromJson(json);

  Map<String, dynamic> toJson() => _$BackupModelToJson(this);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
