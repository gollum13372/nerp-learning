import 'package:fibofuuu/fibofuuu.dart' as fibofuuu;

void fibonach(int f) {
  int n = 1;
  int m = 1;
  String stroka = '';
  while (n < f) {
    stroka = stroka + '$n ';
    int next = n + m;
    n = m;
    m = next;
  }
  print(stroka);
}

void main() {
  fibonach(100);
  fibonach(1000);
  fibonach(1337);
}
