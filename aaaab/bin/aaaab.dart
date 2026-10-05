int maxNum (List<int> massiv) => massiv.reduce((a,b) => a > b ? a : b);
void main() {
  List<int> massiv = [5,4,2,9,8,3];
  int max = maxNum(massiv);
  print(max);
}
