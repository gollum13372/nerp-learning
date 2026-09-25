import 'package:spiski/spiski.dart' as spiski;

void main() {
  
  int sum = 0;
  List<int> points = [4, 5, 3, 5, 4, 2];
  int a = points.length;
  for (var point in points){
    sum += point;
  }
  double mediana = sum/a ;
  print('Средний балл: ${mediana.toStringAsFixed(1)}');

}
