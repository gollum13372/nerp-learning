class Product {
  final String name;
  final int price;
  final int count;

  Product(this.count,this.name,this.price);

  int get total => count * price;

  @override
  String toString() => '$name x$count = $total Р'; 

}