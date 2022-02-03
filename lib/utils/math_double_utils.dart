import 'dart:math';

double stringToDouble(String value) {
  final _stringToDouble = double.parse(value);
  final _mod = pow(10.0, 2);
  return ((_stringToDouble * _mod).round().toDouble() / _mod);
}

double roundDouble(double value) {
  final mod = pow(10.0, 2);
  return ((value * mod).round().toDouble() / mod);
}
