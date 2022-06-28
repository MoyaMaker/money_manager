// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeModeAdapter extends TypeAdapter<ThemeModeAppearance> {
  @override
  final int typeId = 5;

  @override
  ThemeModeAppearance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeModeAppearance.system;
      case 1:
        return ThemeModeAppearance.dark;
      case 2:
        return ThemeModeAppearance.light;
      default:
        return ThemeModeAppearance.system;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeModeAppearance obj) {
    switch (obj) {
      case ThemeModeAppearance.system:
        writer.writeByte(0);
        break;
      case ThemeModeAppearance.dark:
        writer.writeByte(1);
        break;
      case ThemeModeAppearance.light:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeModeStore on _ThemeModeStore, Store {
  late final _$themeModeAtom =
      Atom(name: '_ThemeModeStore.themeMode', context: context);

  @override
  ThemeModeAppearance get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeModeAppearance value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$_ThemeModeStoreActionController =
      ActionController(name: '_ThemeModeStore', context: context);

  @override
  void setThemeModeAppearance(ThemeModeAppearance value) {
    final _$actionInfo = _$_ThemeModeStoreActionController.startAction(
        name: '_ThemeModeStore.setThemeModeAppearance');
    try {
      return super.setThemeModeAppearance(value);
    } finally {
      _$_ThemeModeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ThemeModeStoreActionController.startAction(
        name: '_ThemeModeStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ThemeModeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode}
    ''';
  }
}
