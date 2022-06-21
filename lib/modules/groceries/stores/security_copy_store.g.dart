// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_copy_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SecurityCopyStore on _SecurityCopyStore, Store {
  Computed<List<Map<String, dynamic>>>? _$_getJsonProductsComputed;

  @override
  List<Map<String, dynamic>> get _getJsonProducts =>
      (_$_getJsonProductsComputed ??= Computed<List<Map<String, dynamic>>>(
              () => super._getJsonProducts,
              name: '_SecurityCopyStore._getJsonProducts'))
          .value;
  Computed<List<Map<String, dynamic>>>? _$_getJsonReceiptHistoryComputed;

  @override
  List<Map<String, dynamic>> get _getJsonReceiptHistory =>
      (_$_getJsonReceiptHistoryComputed ??=
              Computed<List<Map<String, dynamic>>>(
                  () => super._getJsonReceiptHistory,
                  name: '_SecurityCopyStore._getJsonReceiptHistory'))
          .value;
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

  @override
  String toString() {
    return '''
securityCopyJson: ${securityCopyJson}
    ''';
  }
}
