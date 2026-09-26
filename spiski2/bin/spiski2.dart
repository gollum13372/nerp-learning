import 'package:spiski2/spiski2.dart' as spiski2;

void main(List<String> arguments) {
List<int> points = [5, 4, 2, 3, 4];
int sum = points.reduce((a,b) => a+b);
print(sum);
int c = points.length;
double point = sum/c;;
print(point);
}
