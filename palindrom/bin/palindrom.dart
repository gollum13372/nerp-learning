bool palindrom(String word) {
  int i = 0;
  int j = word.length - 1;
  while (i < j) {
    if (word[i] != word[j]) {
      return false;
    }
    i++;
    j--;
  }
  return true;
}

void main() {
  String word = 'шашашашш';
  if (palindrom(word)) {
    print('$word: палиндром');
  } else {
    print('$word: не является палиндромом');
  }
}