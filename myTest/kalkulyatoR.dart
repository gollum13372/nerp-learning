import 'dart:io';

void main() {
  //bool isRunning = true; флаг чтобы потом поменять его на false и завершить работу
  mainLoop:
  while (true) {
    print('Введите первое число:');
    String? input1 = stdin.readLineSync();
    double? a = double.tryParse(input1 ?? '');
    if (a == null) {
      print('Введено не число, попробуй ещё раз');
      continue mainLoop; //теперь это возвращает нас не в начало цикла вайл, а чуть выше, что по сути запускает цикл заново
    }

    print('Какую операцию произвести? (+ - / *)');
    String? operator = stdin.readLineSync()?.trim();

    print('Введите второе число:');
    String? input2 = stdin.readLineSync();
    double? b = double.tryParse(input2 ?? '');
    if (b == null) {
      print('Введено не число, попробуй ещё раз');
      continue mainLoop; // аналогично
    }
    double result = 0;

    switch (operator) {
      case '+':
        result = a + b;
        break;
      case '-':
        result = a - b;
        break;
      case '*':
        result = a * b;
        break;
      case '/':
        if (b == 0) {
          print('На ноль делить нельзя');
          continue mainLoop;
        }
        result = a / b;
        break;
      default:
        print('Не верная операция');
        continue mainLoop;
    }
    print('ответ: ${result.toStringAsFixed(2)}');
    print('Хотите продолжить считать? (д/н)');
    String? answer = stdin.readLineSync()?.toLowerCase().trim();

    if (answer == 'н' || answer == 'нет' || answer == 'n' || answer == 'no') {
      print('Программа завершена');
      break mainLoop;
      //  isRunning = false;  тут по сути программа(цикл) должная закрыться (не получилось чето)
    }
  }
}
