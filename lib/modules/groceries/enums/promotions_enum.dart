import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promotions_enum.g.dart';

@JsonEnum()
@HiveType(typeId: 2, adapterName: 'PromotionsAdapter')
enum Promotions {
  @JsonValue("notSelected")
  @HiveField(0)
  notSelected,
  @JsonValue("quantity4UniquePrice")
  @HiveField(1)
  quantity4UniquePrice,
  @JsonValue("percentage")
  @HiveField(2)
  percentage,
  @JsonValue("points")
  @HiveField(3)
  points,
  @JsonValue("p2x1")
  @HiveField(4)
  p2x1,
  @JsonValue("p3x2")
  @HiveField(5)
  p3x2,
  @JsonValue("p4x3")
  @HiveField(6)
  p4x3,
  @JsonValue("q1x70percentage")
  @HiveField(7)
  q1x70percentage,
  @JsonValue("q1AndHalf")
  @HiveField(8)
  q1AndHalf
}

extension PromotionExtension on Promotions {
  String get value {
    switch (this) {
      case Promotions.points:
        return 'Pago con puntos';
      case Promotions.quantity4UniquePrice:
        return r'x$$';
      case Promotions.percentage:
        return '%';
      case Promotions.p2x1:
        return '2x1';
      case Promotions.p3x2:
        return '3x2';
      case Promotions.p4x3:
        return '4x3';
      case Promotions.q1x70percentage:
        return '1 y 70% precio';
      case Promotions.q1AndHalf:
        return '1 y 1/2 precio';
      case Promotions.notSelected:
      default:
        return 'No seleccionado';
    }
  }

  bool get showTextField {
    switch (this) {
      case Promotions.quantity4UniquePrice:
      case Promotions.percentage:
      case Promotions.points:
        return true;
      case Promotions.notSelected:
      default:
        return false;
    }
  }
}
