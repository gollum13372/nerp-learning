
void main() {
  List<String> words = ['программирование', 'ракета', 'туалет', 'программироииииb'];
  String longWord = words.reduce((a, b) => a.length >= b.length ? a : b);
  print(longWord);
}
