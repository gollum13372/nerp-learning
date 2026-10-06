class Rectangle {
 final int long;
 final int weight;

 Rectangle(this.long, this.weight);
 int get area => long*weight;
 int get perimetr => 2*(long+weight);
 bool get isSquare => long == weight;
 
String get _squareText => isSquare ? 'Да' : 'Нет';

 @override
 String toString()=> '${long}x$weight: площадь $area, периметр $perimetr, квадрат $_squareText';
}

void main(){
  final a = Rectangle(3, 4);
  final b = Rectangle(7, 10);
  final c = Rectangle(5, 5);
  print(a);
  print(b);
  print(c);

}