import 'package:dog_cat/dog_cat.dart' as dog_cat;

void main() {
  String text = 'кот пёс кот мышь кот пёс';
  List<String> words = text.split(' ');

  Map<String, int> counts = {};

  for (String word in words) {
    if (counts.containsKey(word)) {
      counts[word] = counts[word]! + 1;
    } else {
      counts[word] = 1;
    }
  }

  String result = counts.entries
      .map((e) => '${e.key}: ${e.value}')
      .join(', ');

  print(result); // кот: 3, пёс: 2, мышь: 1
}