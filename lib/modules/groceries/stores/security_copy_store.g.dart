// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_copy_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SecurityCopyStore on _SecurityCopyStore, Store {
  Computed<String>? _$backupJsonStringComputed;

  @override
  String get backupJsonString => (_$backupJsonStringComputed ??=
          Computed<String>(() => super.backupJsonString,
              name: '_SecurityCopyStore.backupJsonString'))
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
  Future<void> restoreBackupFile(File backupFile) {
    return _$restoreBackupFileAsyncAction
        .run(() => super.restoreBackupFile(backupFile));
  }

  late final _$_SecurityCopyStoreActionController =
      ActionController(name: '_SecurityCopyStore', context: context);

  @override
  String _fileName() {
    final _$actionInfo = _$_SecurityCopyStoreActionController.startAction(
        name: '_SecurityCopyStore._fileName');
    try {
      return super._fileName();
    } finally {
      _$_SecurityCopyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
backupJsonString: ${backupJsonString}
    ''';
  }
}
