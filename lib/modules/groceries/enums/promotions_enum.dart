enum Promotions {
  notSelected,
  quantity4UniquePrice,
  percentage,
  points,
  p2x1,
  p3x2,
  p4x3,
  q1x70percentage,
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
