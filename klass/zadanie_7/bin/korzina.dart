import 'dart:math';

import 'tovar.dart';
class Cart {
  List<Product> _products = [];

  Cart(List<Product> products) {
    this._products = products;
  }

  void addInBasket(Product product) {
    _products.add(product);
  }

  void removeByName(String product) => _products.removeWhere((a) => a.name == product);

  int get total => _products.fold(0, (a, b)=> a + b.total);

  Product get mostExpensive => _products.reduce((a,b)=> a.total > b.total ? a : b);

  bool get isEmpty => _products.isEmpty;

  Iterable<Product> cheaperThan(int price) => _products.where((x)=> x.total < price);
  
  List<Product> sortedByPrice(){
    List<Product> productSort = List.from(_products); 
    productSort.sort((a,b) => a.total.compareTo(b.total));
    return productSort;
  }
@override
String toString() => 'Итого: $total ₽, самый дорогой: ${mostExpensive.name}';

}
