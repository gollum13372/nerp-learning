import 'dart:math';

class Products {
  final String name;
  final int count;
  final int price;
  Products(this.name, this.count, this.price);
  int get totalPrice => count*price;
  bool get isOpt => count>10;
  
  String get _resultOpt => isOpt ? 'да' : 'нет';

  @override
  String toString()=> '$name: $count шт. по $price рублей, сумма: $totalPrice опт: $_resultOpt';
 
}

void main(){
  final a = Products('Яблоки', 3, 50);
  final b = Products('Бананы', 4, 70);
  final c = Products('Персики', 14, 60);
  print(a);
  print(b);
  print(c);
}