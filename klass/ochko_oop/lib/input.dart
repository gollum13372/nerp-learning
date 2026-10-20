import 'dart:io';

class InvalidInputException implements Exception {
  final String input;
  InvalidInputException(this.input);
}

bool askYesNo(String question) {
  print(question);
  final answer = stdin.readLineSync() ?? '';
  if (answer == 'y') return true;
  if (answer == 'n') return false;
  throw InvalidInputException(answer);
}
