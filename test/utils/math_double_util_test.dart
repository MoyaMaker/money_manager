import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/utils/math_double_util.dart';

void main() {
  test('get double from string', () {
    // Arrange
    const expectedResult = 23.56;
    // Act
    final result = stringToDouble('23.56');
    // Assert
    expect(result, expectedResult);
  });

  test('double rounded', () {
    // Arrange
    const expectedResult = 23.56;
    // Act
    final result = roundDouble(23.5621111);
    // Assert
    expect(result, expectedResult);
  });
}
