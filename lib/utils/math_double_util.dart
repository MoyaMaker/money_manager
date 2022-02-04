double stringToDouble(String value) {
  final _stringToDouble = double.parse(value);
  return (_stringToDouble).toDouble();
}

double roundDouble(double value) {
  return double.parse(value.toStringAsFixed(2));
}
