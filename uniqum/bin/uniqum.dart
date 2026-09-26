import 'package:uniqum/uniqum.dart' as uniqum;

void main(List<String> arguments) {
  List<int> massiv = [3, 7, 3, 1, 7, 9] ;
  final unique = massiv.toList().toSet();
  print(unique);
}
