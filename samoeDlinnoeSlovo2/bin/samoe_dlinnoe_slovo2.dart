void main() {
  List<String> words = ['эшкере','программирование', 'ракета', 'туалет', 'программироииииb'];
  words.sort((b, a) => b.compareTo(a));
  print(words[0]);
}