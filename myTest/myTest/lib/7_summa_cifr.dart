void main() {
  int a = 4856321;
  int sum = 0;
  while (a > 0) {
    sum = sum + a % 10;
    a = a ~/ 10;
  }
  print(sum);
}