import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
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
  List<Map<String, dynamic>> get _getJsonProducts =>
      productListStore.products.map((element) => element.toJson()).toList();

  @computed
  List<Map<String, dynamic>> get _getJsonReceiptHistory =>
      receiptHistoryStore.shoppedItems
          .map((element) => element.toJson())
          .toList();

  @computed
  Map<String, dynamic> get securityCopyJson =>
      {"products": _getJsonProducts, "receipt_history": _getJsonReceiptHistory};

  @action
  downloadCopyFile() async {
    final dir = await Directory.systemTemp.createTemp();
    File logFile = File('${dir.path}_app_security_copy.json');

    try {
      logFile = await logFile.writeAsString(jsonEncode(securityCopyJson));

      return logFile;
    } catch (e) {
      throw ErrorDescription('Unable to create log file!\n$e');
    }
  }
}
