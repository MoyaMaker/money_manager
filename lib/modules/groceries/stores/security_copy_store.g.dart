// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_copy_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BackupStore on _BackupStore, Store {
  Computed<String>? _$backupJsonStringComputed;

  @override
  String get backupJsonString => (_$backupJsonStringComputed ??=
          Computed<String>(() => super.backupJsonString,
              name: '_BackupStore.backupJsonString'))
      .value;

  late final _$restoreFileResultAtom =
      Atom(name: '_BackupStore.restoreFileResult', context: context);

  @override
  ObservableFuture<FilePickerResult?>? get restoreFileResult {
    _$restoreFileResultAtom.reportRead();
    return super.restoreFileResult;
  }

  @override
  set restoreFileResult(ObservableFuture<FilePickerResult?>? value) {
    _$restoreFileResultAtom.reportWrite(value, super.restoreFileResult, () {
      super.restoreFileResult = value;
    });
  }

  late final _$downloadCopyFileAsyncAction =
      AsyncAction('_BackupStore.downloadCopyFile', context: context);

  @override
  Future<File?> downloadCopyFile() {
    return _$downloadCopyFileAsyncAction.run(() => super.downloadCopyFile());
  }

  late final _$splitDataAsyncAction =
      AsyncAction('_BackupStore.splitData', context: context);

  @override
  Future splitData(File restore) {
    return _$splitDataAsyncAction.run(() => super.splitData(restore));
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
  void setRestoreFileResult(Future<FilePickerResult?> value) {
    final _$actionInfo = _$_BackupStoreActionController.startAction(
        name: '_BackupStore.setRestoreFileResult');
    try {
      return super.setRestoreFileResult(value);
    } finally {
      _$_BackupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String _fileName() {
    final _$actionInfo = _$_BackupStoreActionController.startAction(
        name: '_BackupStore._fileName');
    try {
      return super._fileName();
    } finally {
      _$_BackupStoreActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
restoreFileResult: ${restoreFileResult},
backupJsonString: ${backupJsonString}
    ''';
  }
}
