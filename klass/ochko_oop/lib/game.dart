import 'dart:io';

import 'deck.dart';
import 'hand.dart';
import 'stats.dart';

class Game {
  Deck _deck = Deck();
  Hand _handPlayer = Hand();
  Hand _handDiller = Hand();
  final Stats _stats =Stats();

  void _playerTurn() {
    while (true) {
      print('Ваши карты: $_handPlayer');
      if (_handPlayer.isBust) {
        print('Перебор!');
        break;
      }
      print('Ещё карту? (y/n)');
      String answer = stdin.readLineSync() ?? '';
      if (answer == 'n') {
        break;
      } else if (answer == 'y') {
        _handPlayer.add(_deck.draw());
      } else {
        continue;
      }
    }
  }

  void _dillerTurn() {
    while (_handDiller.score < 17) {
      _handDiller.add(_deck.draw());
    }
    print('Карты диллера: $_handDiller');
  }

  String winner() {
    if (_handDiller.isGoldenPoint && _handPlayer.isGoldenPoint) {
      return 'Ничья';
    }
    if (_handPlayer.isGoldenPoint) {
      return 'Победа игрока';
    }
    if (_handDiller.isGoldenPoint) {
      return 'Победа диллера';
    }
    if (_handPlayer.isBust) {
      return 'Победа диллера';
    }
    if (_handDiller.isBust) {
      return 'Победа игрока';
    }
    if (_handDiller.score > _handPlayer.score) {
      return 'Победа диллера';
    }
    if (_handPlayer.score > _handDiller.score) {
      return 'Победа игрока';
    } else {
      return 'Ничья';
    }
  }

  String round(){
    _deck = Deck();
    _handDiller = Hand();
    _handPlayer = Hand();
    _handPlayer.add(_deck.draw());
    _handDiller.add(_deck.draw());
    _handPlayer.add(_deck.draw());
    _handDiller.add(_deck.draw());
    if (!(_handDiller.isGoldenPoint || _handPlayer.isGoldenPoint)) {
      _playerTurn();
      _dillerTurn();
    }
    String result = winner();
    return result;
    
  }

  void run() {
    while(true){
      print('Хотите сыграть партию: (y/n)');
      String answer = stdin.readLineSync() ?? '';
      if (answer == 'n') {
        break;
      }else if (answer == 'y'){
        String winnerRound = round();
        _stats.record(winnerRound, _handPlayer.score);
        print (winnerRound);
      }else{
        print('Введите y или n');
        continue;
      }
    }
    print('Партий: ${_stats.games}   Побед: ${_stats.wins}   Поражений: ${_stats.losses}   Ничьих: ${_stats.draws}');
  }
}