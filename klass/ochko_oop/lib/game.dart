import 'dart:io';

import 'deck.dart';
import 'hand.dart';
import 'stats.dart';
import 'player.dart';

class Game {
  final Player player; // здесть будет лежать игрок
  Game(this.player);
  Deck _deck = Deck();
  Hand _handPlayer = Hand();
  Hand _handDiller = Hand();
  final Stats _stats = Stats();

  void _playerTurn() {
    while (true) {
      if (_handPlayer.isBust) {
        break;
      }
      if (player.wantsCard(_handPlayer, _handDiller.firstCard)) {
        _handPlayer.add(_deck.draw());
      } else {
        break;
      }
    }
  }

  void _dillerTurn() {
    while (_handDiller.score < 17) {
      _handDiller.add(_deck.draw());
    }
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

  String round() {
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
    while (true) {
      print('Хотите сыграть партию: (y/n)');
      String answer = stdin.readLineSync() ?? '';
      if (answer == 'n') {
        break;
      } else if (answer == 'y') {
        String winnerRound = round();
        print('Ваши карты: $_handPlayer');
        if (_handPlayer.isBust) print('Перебор!');
        print('Карты диллера: $_handDiller');
        _stats.record(winnerRound, _handPlayer.score);
        print(winnerRound);
      } else {
        print('Введите y или n');
        continue;
      }
    }
    print(
      'Партий: ${_stats.games}   Побед: ${_stats.wins}   Поражений: ${_stats.losses}   Ничьих: ${_stats.draws}',
    );
  }

  double simulate(int games) {
    for (int i = 0; i < games; i++) {
      final result = round();
      _stats.record(result, _handPlayer.score);
    }
    return _stats.wins / _stats.games * 100;
  }
}
