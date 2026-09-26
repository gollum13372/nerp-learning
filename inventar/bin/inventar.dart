import 'package:inventar/inventar.dart' as inventar;

void main(List<String> arguments) {
  Map<String, int> inventa = {
    'Лопата': 5,
    'Грабли': 3,
    'Совок': 18,
  };
  print(inventa);

  writeOff(inventa, 'Лопата', 3);  
  writeOff(inventa, 'Совок', 50);  
  inventa.update('Грабли', (value) => value + 83);

  print(inventa);
}

void writeOff(Map<String, int> stock, String item, int amount) {
  int current = stock[item] ?? 0;

  if (amount > current) {
    print('Нельзя списать $amount шт. "$item": на складе только $current');
    return;
  }

  stock.update(item, (value) => value - amount);
  print('Списано $amount шт. "$item", осталось ${current - amount}');
}