import 'package:my_test/my_test.dart' as my_test;
import 'dart:io';

void main(List<String> arguments) {
  String? firstStr = stdin.readLineSync();
  String? secondStr = stdin.readLineSync();
  int firstInt = int.tryParse(firstStr ?? '')?? 0;
  int secondInt = int.tryParse(secondStr ?? '')?? 0;
  int s = firstInt*secondInt;
  int p = 2*(firstInt+secondInt);
print ('Площадь : $s, периметр $p');
}
