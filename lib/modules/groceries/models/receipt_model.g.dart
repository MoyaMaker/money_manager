// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReceiptAdapter extends TypeAdapter<Receipt> {
  @override
  final int typeId = 3;

  @override
  Receipt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Receipt(
      id: fields[0] as String,
      storeName: fields[1] as String,
      buyDate: fields[2] as DateTime,
      itemsList: (fields[3] as List).cast<CartItemStore>(),
    );
  }

  @override
  void write(BinaryWriter writer, Receipt obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.storeName)
      ..writeByte(2)
      ..write(obj.buyDate)
      ..writeByte(3)
      ..write(obj.itemsList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReceiptAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
