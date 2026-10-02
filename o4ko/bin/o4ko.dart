import 'package:o4ko/o4ko.dart' as o4ko;

import 'dart:io';
import 'dart:math';

//'\u{2665}'; // ♥
//'\u{2666}'; // ♦
//'\u{2660}'; // ♠
//'\u{2663}'; // ♣
//[ВОЗВРАЩАЕМЫЙ_ТИП] Название_метода([ВХОДЯЩИЙ_ТИП] Название_переменной)
int drawCard(Map<String, int> deck, List <String> hand){
  List<String> nameCard = deck.keys.toList();//список с ключами колоды
  int randomNumber = Random().nextInt(nameCard.length); // Число от 0 до 36 включительно;
  String card = nameCard[randomNumber];//карта, которую получает игрок (ключ)
  hand.add(card); // формируем список с названиями карт, чтобы было наглядно, что вытянул а не просто набор очков
  int cardPoint = deck[card] ?? 0;//Аккумулируем очки
  deck.remove(card);//удаляем карту по ключу из мапы(колоды)

  return cardPoint;
}

int player(Map<String, int> deck, List <String> hand, int pointPlayer) {
  
  while (true) {
    
    if (pointPlayer > 21){
      print('Перебор!');
      break;
    }
    stdout.write('Хотите взять ещё одну карту?:\n1)Да\n2)Нет\n');
    String? otvet = stdin.readLineSync();
    if (otvet == '1') {
      pointPlayer += drawCard(deck, hand);
      print('Ваши карты ${hand.join(' ')}\nВаши очки:   $pointPlayer');
    }
    else{
      break;
    }
  }
  return pointPlayer;
}
 int diller (Map <String, int> deck, List <String> hand, int pointDiller){
  while (pointDiller < 17){
    pointDiller += drawCard(deck, hand);
  }


  return pointDiller;
 }
  
String round () {
    Map <String, int> deck = {
    '6\u{2665}': 6,
    '6\u{2666}': 6,
    '6\u{2660}': 6,
    '6\u{2663}': 6,
    '7\u{2665}': 7,
    '7\u{2666}': 7,
    '7\u{2660}': 7,
    '7\u{2663}': 7,
    '8\u{2665}': 8,
    '8\u{2666}': 8,
    '8\u{2660}': 8,
    '8\u{2663}': 8,
    '9\u{2665}': 9,
    '9\u{2666}': 9,
    '9\u{2660}': 9,
    '9\u{2663}': 9,
    '10\u{2665}': 10,
    '10\u{2666}': 10,
    '10\u{2660}': 10,
    '10\u{2663}': 10,
    'valet\u{2665}': 2,
    'valet\u{2666}': 2,
    'valet\u{2660}': 2,
    'valet\u{2663}': 2,
    'queen\u{2665}': 3,
    'queen\u{2666}': 3,
    'queen\u{2660}': 3,
    'queen\u{2663}': 3,
    'king\u{2665}': 4,
    'king\u{2666}': 4,
    'king\u{2660}': 4,
    'king\u{2663}': 4,
    'tuz\u{2665}': 11,
    'tuz\u{2666}': 11,
    'tuz\u{2660}': 11,
    'tuz\u{2663}': 11,
  };
  List<String> handPlayer =[];
  List<String> handDiller =[];
  int pointPlayer = 0;
  int pointDiller = 0;
  pointPlayer += drawCard(deck, handPlayer);
  pointPlayer += drawCard(deck, handPlayer);
  pointDiller += drawCard(deck, handDiller);
  pointDiller += drawCard(deck, handDiller);
  if (pointDiller == pointPlayer && pointPlayer == 22){
    return 'Ничья';
  }
  if (handPlayer.length == 2 && pointPlayer == 22){
    print('Поздравляю! У вас золотое очко!');
    return 'Победа игрока';
    }
  if (handDiller.length == 2 && pointDiller == 22){
    print('У диллера оказалось золотое очко!');
    return 'Победа диллера';
  }
  print('Ваши карты: ${handPlayer.join(' ')}\nВаши очки: $pointPlayer\nКарты диллера: ${handDiller[0]} ****\n');
  pointPlayer = player(deck, handPlayer, pointPlayer);
  pointDiller = diller(deck, handDiller, pointDiller);
  print('Ваши карты ${handPlayer.join(' ')}     Ваши очки:   $pointPlayer');
  print('Карты диллера ${handDiller.join(' ')}    Диллер очки:   $pointDiller');
  
  
   if (pointPlayer > pointDiller && pointPlayer <= 21){
    return 'Победа игрока';
  }
  else if (pointPlayer > 21){
    return 'Победа диллера';
  }
  else if (pointDiller >21){
    return 'Победа игрока';
  }
  
  else if (pointDiller > pointPlayer && pointDiller <=21){
    return'Победа диллера';
    
  }
  else {
    return 'Ничья';
  }
}

void main() {
  
  int winPlayer = 0;
  int winDiller = 0;
  int nichya = 0;
  while(true){
    print('Победы игрока: $winPlayer');
    print('Победы Диллера: $winDiller');
    print('Ничьих: $nichya');
    stdout.write('Хотите начать новую игру?:\n1)Да\n2)Нет\n');
    String? message = stdin.readLineSync();
    
    if (message != '1' && message != '2'){
      print('Введите 1 или 2');
      continue;
    }
    else if (message == '2'){
      break;
    }

    String result = round();
    if (result == 'Победа игрока'){
      print('===ПОБЕДА ИГРОКА===');
      winPlayer++;
      }
    else if (result == 'Победа диллера'){
      print('===ПОБЕДА ДИЛЛЕРА===');
      winDiller++;
      }
    else if (result == 'Ничья'){
      print('===НИЧЬЯ===');
      nichya++;
      }
    

}
print('Победы игрока: $winPlayer');
print('Победы Диллера: $winDiller');
print('Ничьих: $nichya'); 
}


