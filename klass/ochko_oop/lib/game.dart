import 'dart:io';
import 'card.dart';
import 'deck.dart';
import 'hand.dart';
import 'stats.dart';
import 'player.dart';
import 'input.dart';
class Game {
  final Player player; // здесть будет лежать игрок
  Game(this.player);
  Deck _deck = Deck();
  Hand _handPlayer = Hand();
  Hand _handDiller = Hand();
  final Stats _stats = Stats();

  Card _drawCard() {
  try {
    return _deck.draw();
  } on EmptyDeckException {
    print('Колода закончилась — тасую новую');
    _deck = Deck();
    return _deck.draw();
  }
}

  void _playerTurn() {
    while (true) {
      if (_handPlayer.isBust) {
        break;
      }
      if (player.wantsCard(_handPlayer, _handDiller.firstCard)) {
        _handPlayer.add(_drawCard());
      } else {
        break;
      }
    }
  }

  void _dillerTurn() {
    while (_handDiller.score < 17) {
      _handDiller.add(_drawCard());
    }
  }

  GameResult winner() {
    if (_handDiller.isGoldenPoint && _handPlayer.isGoldenPoint) {
      return GameResult.draw;
    }
    if (_handPlayer.isGoldenPoint) {
      return GameResult.playerWin;
    }
    if (_handDiller.isGoldenPoint) {
      return GameResult.dillerWin;
    }
    if (_handPlayer.isBust) {
      return GameResult.dillerWin;
    }
    if (_handDiller.isBust) {
      return GameResult.playerWin;
    }
    if (_handDiller.score > _handPlayer.score) {
      return GameResult.dillerWin;
    }
    if (_handPlayer.score > _handDiller.score) {
      return GameResult.playerWin;
    } else {
      return GameResult.draw;
    }
  }

  GameResult round() {
    //_deck = Deck();
    _handDiller = Hand();
    _handPlayer = Hand();
    _handPlayer.add(_drawCard());
    _handDiller.add(_drawCard());
    _handPlayer.add(_drawCard());
    _handDiller.add(_drawCard());
    if (!(_handDiller.isGoldenPoint || _handPlayer.isGoldenPoint)) {
      _playerTurn();
      _dillerTurn();
    }
    GameResult result = winner();
    return result;
  }

  void run() {
  while (true) {
    try {
      final wantsToPlay = askYesNo('Хотите сыграть партию? (y/n)');
      if (!wantsToPlay) break;

      GameResult winnerRound = round();
      print('Ваши карты: $_handPlayer');
      if (_handPlayer.isBust) print('Перебор!');
      print('Карты диллера: $_handDiller');
      _stats.record(winnerRound, _handPlayer.score);
      final text = switch (winnerRound) {
        GameResult.playerWin => 'Победа игрока',
        GameResult.dillerWin => 'Победа дилера',
        GameResult.draw => 'Ничья',
      };
      print(text);
    } on InvalidInputException catch (e) {
      print('Не понял ответ «${e.input}», введи д или н');
    }
  }
  print('Побед: ${_stats.wins} из ${_stats.games}');
}

  double simulate(int games) {
    for (int i = 0; i < games; i++) {
      final result = round();
      _stats.record(result, _handPlayer.score);
    }
    return _stats.wins / _stats.games * 100;
  }
}
