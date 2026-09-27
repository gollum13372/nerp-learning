import 'package:top3/top3.dart' as top3;

void main(List<String> arguments) {
  List<double> price = [105.0, 340.5, 67.67, 120.0, 89.0];
  price.sort((a, b) => b.compareTo(a));
  print(price.take(3));

}
