import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:money_manager/modules/groceries/models/receipt_model.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

part 'backup_model.g.dart';

@JsonSerializable()
class BackupModel {
  @JsonKey(name: "products")
  final List<ProductStore> productList;

  @JsonKey(name: "receipt_history")
  final List<Receipt> receiptHistory;

  BackupModel(this.productList, this.receiptHistory);

  factory BackupModel.fromJson(Map<String, dynamic> json) =>
      _$BackupModelFromJson(json);

  Map<String, dynamic> toJson() => _$BackupModelToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

class BackupRestored {
  final int productsLoaded;
  final int receiptsLoaded;
  final int productsAdded;
  final int receiptsAdded;

  BackupRestored(
      {required this.productsAdded,
      required this.receiptsAdded,
      required this.productsLoaded,
      required this.receiptsLoaded});
}
