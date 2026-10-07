class Card{
  final String _numberCard;

  Card(this._numberCard);
  

  String get mask => '**** **** **** ${_numberCard.substring(_numberCard.length-4)}';

  @override
  String toString() => 'Номер карты пользователя: $mask';
}