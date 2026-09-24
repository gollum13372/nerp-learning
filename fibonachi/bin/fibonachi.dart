import 'package:fibonachi/fibonachi.dart' as fibonachi;

void main(List<String> arguments) {
  int n = 1;
  int m = 1;
  while ( n < 100){
    print(n);
    int next = n + m;
    n = m;
    m = next;
  }
}
