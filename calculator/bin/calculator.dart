import 'dart:io';

double? readNumber(String prompt) {
  print(prompt);
  String? input = stdin.readLineSync();
  return double.tryParse(input ?? '');
}

String? readOperation() {
  print('Какую операцию произвести? (+ - / *)');
  String? operator = stdin.readLineSync()?.trim();
  if (operator == '+' || operator == '-' || operator == '*' || operator == '/') {
    return operator;
  }
  return null;
}

double? calculate(double a, double b, String operation) {
  switch (operation) {
    case '+':
      return a + b;
    case '-':
      return a - b;
    case '*':
      return a * b;
    case '/':
      if (b == 0) {
        return null;
      }
      return a / b;
    default:
      return null;
  }
}

bool askAgain() {
  print('Хотите продолжить считать? (y/n)');
  String? answer = stdin.readLineSync()?.toLowerCase().trim();
  return !(answer == 'n' || answer == 'no');
}
 
void main() {
  mainLoop:
  while (true) {
    double? a = readNumber('Введите первое число:');
    if (a == null) {
      print('Введено не число, попробуй ещё раз');
      continue mainLoop;
    }

    String? operation = readOperation();
    if (operation == null) {
      print('Не верная операция');
      continue mainLoop;
    }

    double? b = readNumber('Введите второе число:');
    if (b == null) {
      print('Введено не число, попробуй ещё раз');
      continue mainLoop;
    }

    double? result = calculate(a, b, operation);
    if (result == null) {
      print('На ноль делить нельзя');
      continue mainLoop;
    }

    print('ответ: ${result.toStringAsFixed(2)}');

    if (!askAgain()) {
      print('Программа завершена');
      break mainLoop;
    }
  }
}