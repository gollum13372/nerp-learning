import 'dart:io';

import 'hand.dart';
import 'card.dart';

abstract class Player {
  String get name;
  bool wantsCard(Hand hand, Card dealerOpenCard);
}

class TresholdBot extends Player { // класс позволяющий создать ботов , которые берут до опр.кол-ва очков
  @override
  final String name;

  final int treshold;

  TresholdBot(this.name, this.treshold);
  @override
  bool wantsCard(Hand hand, Card dealerOpenCard) => hand.score < treshold;
}

class HumanPlayer extends Player { //на случай если сам захочу поиграть
  @override
  final String name;

  HumanPlayer(this.name);
  @override
  bool wantsCard(Hand hand, Card dealerOpenCard) {
    print('Ваши карты: $hand');
    print('Карта диллера: $dealerOpenCard');
    while (true) {
      print('Ещё карту? (y/n)');
      String answer = stdin.readLineSync() ?? '';
      if (answer == 'n') {
        return false;
      } else if (answer == 'y') {
        return true;
      } else {
        print('Введите y или n');
        continue;
      }
    }
  }
}

class SmartBot extends Player{ // умный бот 
  @override
  final String name;
  SmartBot(this.name);
  @override
  bool wantsCard(Hand hand, Card dealerOpenCard){
      //берет если у диллера туз и меньше 15, а если у диллера нет туза то берем меньше 17
      if(dealerOpenCard.isAce && hand.score < 15){
        return true;
      }if(hand.score < 17){
        return true;
      }else{
        return false;
        }
    }
  
}