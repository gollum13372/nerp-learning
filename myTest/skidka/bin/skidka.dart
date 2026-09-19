void main() {
  int price = 2500;
  int sale = 15;
  double total = price - (price * sale / 100);
  String format = total.toStringAsFixed(2);
  print('Итого: $format');
}