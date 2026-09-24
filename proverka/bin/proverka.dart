void main() {
  int n = 97;

  bool a = true;

  if (n <= 1) {
    a = false;
  } else {
    for (int i = 2; i < n; i++) {
      if (n % i == 0) {
        a = false;
        break;
      }
    }
  }

  print('$n  ${a ? 'простое' : 'не простое'}');
}