double stringToDouble(String value) {
  final stringToDouble = double.parse(value);
  return (stringToDouble).toDouble();
}

double roundDouble(double value) => double.parse(value.toStringAsFixed(2));
