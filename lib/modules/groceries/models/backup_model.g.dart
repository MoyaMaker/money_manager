// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackupModel _$BackupModelFromJson(Map<String, dynamic> json) => BackupModel(
      (json['products'] as List<dynamic>)
          .map((e) => ProductStore.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['receipt_history'] as List<dynamic>)
          .map((e) => Receipt.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackupModelToJson(BackupModel instance) =>
    <String, dynamic>{
      'products': instance.productList,
      'receipt_history': instance.receiptHistory,
    };
