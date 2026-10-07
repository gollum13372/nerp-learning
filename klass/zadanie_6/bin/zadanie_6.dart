class Tovars{
  final String name;
  final int _price;
  final int _quanity;

  Tovars(this.name, this._price, this._quanity);

  int get total => _price ~/100 * _quanity;
  int get ostatok => _price % 100 * _quanity;
  String get kopeiki => ostatok != 0 ? '$ostatok копеек.' : '';

  @override
  String toString() => '$name x $_quanity шт = $total₽ $kopeiki';
}

void main(){
  final apple = Tovars('Яблоки', 10000, 15);
  final coffe = Tovars('Коффе', 45005, 3);
  final candys = Tovars('Конфеты', 24000, 4);
  print(apple);
  print(coffe);
  print(candys);
}