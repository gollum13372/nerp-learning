enum Suit{
  piki('♠'),
  chervy('♥'),
  tref('♣'),
  buba('♦');
  final String symbol;
  const Suit(this.symbol);
  
  }
class Card {
  final String rank;
  final Suit suit;

  Card(this.rank, this.suit);

  static const Map<String, int> valueMap = {
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'V': 2,
    'D': 3,
    'K': 4,
    'T': 11,
  };

  int get value => valueMap[rank] ?? 0;
  bool get isAce => rank == 'T';
  bool get ispictures => rank == 'V' || rank == 'D' || rank == 'K';

  @override
  String toString() => '$rank ${suit.symbol}';
}
