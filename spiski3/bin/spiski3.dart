import 'package:spiski3/spiski3.dart' as spiski3;

void main(List<String> arguments) {
  List<int> points = [2,4,5,3,2,5,4,2,3,2,4,5,2,5,5];
  int sum = points.reduce((a,b) => a + b);
  int c = points.length;
  double point = sum/c;
  print(points.where((n)=> n > point));
}


