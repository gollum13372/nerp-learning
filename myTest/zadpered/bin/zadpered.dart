void main() {
  String a = 'Программист';
  String b = '';
  for (int i = a.length - 1; i >= 0; i--) {
    b = b + a[i];
  }
  print(b);
}