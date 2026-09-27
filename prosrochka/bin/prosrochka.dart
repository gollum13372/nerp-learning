import 'package:prosrochka/prosrochka.dart' as prosrochka;

void main(List<String> arguments) {
  List<int> n = [1, 2, 3, 4, -1, -8, 5, 7, 3];
  var dayOtric = n.any((d) => d<0);
  var howDays = n.where((x) => x<0).length;
  print(dayOtric);
  print(howDays);
}
