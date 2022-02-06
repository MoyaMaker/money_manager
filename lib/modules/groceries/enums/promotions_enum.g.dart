// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PromotionsAdapter extends TypeAdapter<Promotions> {
  @override
  final int typeId = 2;

  @override
  Promotions read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Promotions.notSelected;
      case 1:
        return Promotions.quantity4UniquePrice;
      case 2:
        return Promotions.percentage;
      case 3:
        return Promotions.points;
      case 4:
        return Promotions.p2x1;
      case 5:
        return Promotions.p3x2;
      case 6:
        return Promotions.p4x3;
      case 7:
        return Promotions.q1x70percentage;
      case 8:
        return Promotions.q1AndHalf;
      default:
        return Promotions.notSelected;
    }
  }

  @override
  void write(BinaryWriter writer, Promotions obj) {
    switch (obj) {
      case Promotions.notSelected:
        writer.writeByte(0);
        break;
      case Promotions.quantity4UniquePrice:
        writer.writeByte(1);
        break;
      case Promotions.percentage:
        writer.writeByte(2);
        break;
      case Promotions.points:
        writer.writeByte(3);
        break;
      case Promotions.p2x1:
        writer.writeByte(4);
        break;
      case Promotions.p3x2:
        writer.writeByte(5);
        break;
      case Promotions.p4x3:
        writer.writeByte(6);
        break;
      case Promotions.q1x70percentage:
        writer.writeByte(7);
        break;
      case Promotions.q1AndHalf:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromotionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
