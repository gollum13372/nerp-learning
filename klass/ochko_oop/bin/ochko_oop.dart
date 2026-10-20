import 'package:ochko_oop/card.dart';
import 'package:ochko_oop/hand.dart';
import 'package:ochko_oop/player.dart';
import 'package:ochko_oop/game.dart';
import 'package:ochko_oop/deck.dart';

class BotResult {
  final String name;
  final double winRate;
  BotResult(this.name, this.winRate);
}

void main() {
  //  final game = Game(HumanPlayer('Миша'));
  //  game.run();
  int parts = 1000;
  final game13 = Game(TresholdBot('Порог 13', 13));
  double result13 = game13.simulate(parts);
  final game14 = Game(TresholdBot('Порог 14', 14));
  double result14 = game14.simulate(parts);
  final game15 = Game(TresholdBot('Порог 15', 15));
  double result15 = game15.simulate(parts);
  final game16 = Game(TresholdBot('Порог 16', 16));
  double result16 = game16.simulate(parts);
  final game17 = Game(TresholdBot('Порог 17', 17));
  double result17 = game17.simulate(parts);
  final smartGame = Game(SmartBot('MikhalBot'));
  double resultSmart = smartGame.simulate(parts);
  List<BotResult> botResult = [
    BotResult('Порог 13', result13),
    BotResult('Порог 14', result14),
    BotResult('Порог 15', result15),
    BotResult('Порог 16', result16),
    BotResult('Порог 17', result17),
    BotResult('Умный бот', resultSmart),
  ];
  botResult.sort((a, b) => b.winRate.compareTo(a.winRate));
  for(int i=0; i<botResult.length; i++){
    print('${i+1}) ${botResult[i].name}:    ${botResult[i].winRate}%');
  }
}
