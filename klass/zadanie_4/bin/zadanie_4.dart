import 'bank_card.dart';
void main (){
  final userCardOne = Card('2200444455551337');
  final userCardTwo = Card('2200111155555228');
  final userCardThree = Card('2200555555559756');
  print(userCardOne);
  print(userCardTwo);
  print(userCardThree);
  print(userCardOne.mask);

}