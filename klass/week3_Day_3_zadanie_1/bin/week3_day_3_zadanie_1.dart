import 'dart:math';

abstract class Shape { 
  String get name;
  double get area;
  double get perimetr;

  @override
  String toString() =>
      '$name: площадь: ${area.toStringAsFixed(1)} периметр: ${perimetr.toStringAsFixed(1)}\n';
}

class Circle extends Shape {// наследник фигуры
  final double radius;

  Circle(this.radius);
  @override
  String get name => 'круг';
  @override
  double get area => pi * radius * radius;
  @override
  double get perimetr => 2 * pi * radius;
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  String get name => 'прямоугольник';
  @override
  double get area => width * height;
  @override
  double get perimetr => 2 * (width + height);
}

class Square extends Shape {
  final double side;
  Square(this.side);
  @override
  String get name => 'квадрат';
  @override
  double get area => side * side;
  @override
  double get perimetr => 4 * side;
}

class Triangle extends Shape {
  final double sideA;
  final double sideB;
  final double sideC;

  Triangle(this.sideA, this.sideB, this.sideC);

  @override
  String get name => "треугольник";

  @override
  double get perimetr => sideA+sideB+sideC;

  @override
  double get area => sqrt((perimetr-sideA)*(perimetr-sideB)*(perimetr-sideC));

  
}

void main() {
  
  List<Shape> shapes = [Circle(2), Rectangle(2, 4), Square(5), Triangle(3, 4, 5),Circle(3),Triangle(2, 3, 4)];// список фигур
  double totalArea = shapes.fold(0, (a,b)=> a+b.area);// сумма площадей
  shapes.sort((a,b)=> b.area.compareTo(a.area));//  от большего к меньшему
  final bigShape = shapes.where((s)=> s.area>20);// все кто больше 20
  final int countCircle = shapes.whereType<Circle>().length;//  сколько кругов
  
  
  
  print('Общая площадь: ${totalArea.toStringAsFixed(1)}, самая большая: ${shapes.first.name}');
  print('Гиганты: $bigShape\n Кругов: $countCircle');






  
}
