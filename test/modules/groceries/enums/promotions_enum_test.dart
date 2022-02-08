import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';

void main() {
  group('Check promotions extension', () {
    test('enum points', () {
      expect(Promotions.points.value, 'Pago con puntos');
    });

    test('enum quantity4UniquePrice', () {
      expect(Promotions.quantity4UniquePrice.value, r'x$$');
    });

    test('enum percentage', () {
      expect(Promotions.percentage.value, '%');
    });

    test('enum p3x2', () {
      expect(Promotions.p3x2.value, '3x2');
    });

    test('enum p4x3', () {
      expect(Promotions.p4x3.value, '4x3');
    });

    test('enum q1AndHalf', () {
      expect(Promotions.q1AndHalf.value, '1 y 1/2 precio');
    });

    test('enum q1x70percentage', () {
      expect(Promotions.q1x70percentage.value, '1 y 70% precio');
    });
  });
}
