import 'card.dart';
class Hand {
  final List<Card> _cards = [];

  void add(Card card){
    _cards.add(card);
  }

  int get score => _cards.fold(0, (a, b) => a+b.value );

  Card get firstCard => _cards.first;

  bool get isBust => score>21;

  bool get isGoldenPoint => _cards.length == 2 && _cards.every((card) => card.isAce);

  List<Card> get pictures => _cards.where((card)=> card.ispictures).toList();

  int get suitCount => _cards.map((card) => card.suit).toSet().length;


  @override
  String toString() => '${_cards.join(' ')} : $score';
}