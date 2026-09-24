import 'package:faktorial/faktorial.dart' as faktorial;

int factorial(int n) {
  int a = 1;
  for (int i = 1; i<= n ; i++){
    a = a*i;
  }
  return a;
}
void main(List<String> arguments) {
  print(factorial(10));
  print(factorial(5));
  print(factorial(0));
}
