// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BackupStore on _BackupStore, Store {
  Computed<String>? _$securityBackupJsonStringComputed;

  @override
  String get securityBackupJsonString => (_$securityBackupJsonStringComputed ??=
          Computed<String>(() => super.securityBackupJsonString,
              name: '_BackupStore.securityBackupJsonString'))
      .value;

  late final _$exportSecurityBackupAsyncAction =
      AsyncAction('_BackupStore.exportSecurityBackup', context: context);

  @override
  Future<File?> exportSecurityBackup() {
    return _$exportSecurityBackupAsyncAction
        .run(() => super.exportSecurityBackup());
  }

  late final _$restoreBackupFileAsyncAction =
      AsyncAction('_BackupStore.restoreBackupFile', context: context);

  @override
  Future<void> restoreBackupFile(File backupFile) {
    return _$restoreBackupFileAsyncAction
        .run(() => super.restoreBackupFile(backupFile));
  }

  late final _$_BackupStoreActionController =
      ActionController(name: '_BackupStore', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$_BackupStoreActionController.startAction(
        name: '_BackupStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_BackupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String _securityBackupFileName() {
    final _$actionInfo = _$_BackupStoreActionController.startAction(
        name: '_BackupStore._securityBackupFileName');
    try {
      return super._securityBackupFileName();
    } finally {
      _$_BackupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
securityBackupJsonString: ${securityBackupJsonString}
    ''';
  }
}
