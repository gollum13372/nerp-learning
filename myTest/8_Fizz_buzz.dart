void main() {
  for (int a = 1; a <= 30; a++) {
    if (a % 15 < 1) {
      print('FizzBuzz');
    } else if (a % 3 < 1) {
      print('Fizz');
    } else if (a % 5 < 1) {
      print('Buzz');
    } else {
      print(a);
    }
  }
}