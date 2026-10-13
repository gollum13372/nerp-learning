import 'korzina.dart';
import 'tovar.dart';

import 'dart:io';

void main() {
  final cart =Cart([]);
  while (true) {
    print('1 - добавить товар');
    print('2 - удалить товар');
    print('3 - узнать стоимость корзины');
    print('4 - оплатить покупки товар');
    
    String? text = stdin.readLineSync();
    if (text == '1') {
      print('Введите название товара: ');
      String? name = stdin.readLineSync() ?? '';
      print('Введите количество товара: ');
      int? count = int.tryParse(stdin.readLineSync() ?? '');
      print('Введите цену товара: ');
      int? price = int.tryParse(stdin.readLineSync() ?? '');
      if (count == null || price == null) {
        print('Количество и цена должны быть числами');
        continue;
      }
      cart.addInBasket(Product(count, name, price));
    }else if (text == '2'){
      print('Введите название товара, который хотите удалить: ');
      String? name = stdin.readLineSync() ?? '';
      cart.removeByName(name);
    
    }else if (text == '3'){
      print (cart.total);
    }else if (text == '4'){
      print(cart);
      break;
    }
    else{
      continue;
    }
  }

  // final List<Product> basketSpisok = [
  //   Product(3,'coffe',350),
  //   Product(7,'apple',100),
  //   Product(4,'tea',70),
  //   Product(5,'cookis',130),
  // ];

  // final cart = Cart(basketSpisok);
  // print(cart);
}
