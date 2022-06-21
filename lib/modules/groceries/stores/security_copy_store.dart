import 'dart:convert';
import 'dart:io';

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
  Future<File?> downloadCopyFile() async {
    final dir = await Directory.systemTemp.createTemp();
    File jsonFile = File(
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_app_security_copy.json');

    try {
      final jsonString = jsonEncode(securityCopyJson);
      final file = await jsonFile.writeAsString(jsonString);

      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
