// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_copy_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackupModel _$BackupModelFromJson(Map<String, dynamic> json) => BackupModel(
      (json['productList'] as List<dynamic>)
          .map((e) => ProductStore.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['receiptHistory'] as List<dynamic>)
          .map((e) => Receipt.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackupModelToJson(BackupModel instance) =>
    <String, dynamic>{
      'productList': instance.productList,
      'receiptHistory': instance.receiptHistory,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SecurityCopyStore on _SecurityCopyStore, Store {
  Computed<Map<String, dynamic>>? _$securityCopyJsonComputed;

  @override
  Map<String, dynamic> get securityCopyJson => (_$securityCopyJsonComputed ??=
          Computed<Map<String, dynamic>>(() => super.securityCopyJson,
              name: '_SecurityCopyStore.securityCopyJson'))
      .value;

  late final _$downloadCopyFileAsyncAction =
      AsyncAction('_SecurityCopyStore.downloadCopyFile', context: context);

  @override
  Future<File?> downloadCopyFile() {
    return _$downloadCopyFileAsyncAction.run(() => super.downloadCopyFile());
  }

  late final _$restoreBackupFileAsyncAction =
      AsyncAction('_SecurityCopyStore.restoreBackupFile', context: context);

  @override
  Future restoreBackupFile(File backupFile) {
    return _$restoreBackupFileAsyncAction
        .run(() => super.restoreBackupFile(backupFile));
  }

  @override
  String toString() {
    return '''
securityCopyJson: ${securityCopyJson}
    ''';
  }
}
