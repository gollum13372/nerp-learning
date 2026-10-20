import 'card.dart';

class EmptyDeckException implements Exception {}

class Deck {
  static const List<String> _ranks = [
    '6',
    '7',
    '8',
    '9',
    '10',
    'V',
    'D',
    'K',
    'T',
  ];

  final List<Card> _cards = [];
  Deck() {
    _cards.addAll(
      Suit.values.expand((suit) => _ranks.map((rank) => Card(rank, suit))),
    );
    _cards.shuffle();
  }

  List<Card> get cards => List.unmodifiable(_cards);

  Card draw() {
    if (isEmpty) {
      throw EmptyDeckException();
    } else {
      return _cards.removeLast();
    }
  }

  int get remaining => _cards.length;

  bool get isEmpty => _cards.isEmpty;
}
