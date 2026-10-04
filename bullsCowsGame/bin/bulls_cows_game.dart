import 'dart:math';
import 'dart:io';

List<int> generateSecret() {
  List<int> secret = [];
  while (secret.length < 4) {
    int num = Random().nextInt(10);
    if (secret.contains(num)) {
      continue;
    } else {
      secret.add(num);
    }
  }
  return secret;
}

bool isValidGuess(String input) {
  List<String> reWrite = [];
  int i = 0;
  if (input.length != 4) {
    return false;
  }
  for (i = 0; i < 4; i++) {
    if (int.tryParse(input[i]) == null) {
      return false;
    }
    if (reWrite.contains(input[i])) {
      return false;
    }
    reWrite.add(input[i]);
  }
  return true;
}

List<int> playerPart() {
  while (true){
  stdout.write('Введите 4 не повторяющихся числа\n');
  String input = stdin.readLineSync() ?? '';
  if (isValidGuess(input)) {
    return toDigits(input);
  }
  }
  
}
int countBull (List<int> secret, List<int> digits){
  int bulls = 0;
  for (int i = 0; i<4; i++){
    if (digits[i] == secret[i]){
      bulls++;
    }

  }
  return bulls;
}
int countCow (List<int> secret, List<int>digits){
  int cows = 0;
  for (int i = 0; i<4; i++){
    if (secret.contains(digits[i]) && digits[i] != secret[i]){
      cows++;
    }
  }
  return cows;
} 


List<int> toDigits(String input){
  List<int> digits = input.split('').map(int.parse).toList();
  return digits;
}

void main() {
  List<int> secret = generateSecret();
  int attempts = 0;

  while(true){
    List<int> guess = playerPart();
    attempts++;
    int bulls = countBull(secret, guess);
    int cows = countCow(secret, guess);
    print('Быков: $bulls\nКоров: $cows');
    if (bulls == 4){
      print('=====Поздравляю!=====');
      print('Ты отгадал с $attempts попытки!');
      return;
    }
  }
}
