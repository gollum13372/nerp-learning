List <int> chet (List<int> massiv) => massiv.where((x) => x % 2 == 0).toList();
double srednee (List<int> massiv){
  double x = massiv.reduce((a,b) => a+b)/massiv.length;
  return x;
}
void main() {
  List<int> massiv = [1,2,3,4,5,6,7,8,9];
  List<int> result = chet(massiv);
  double result1 = srednee(massiv);
  print (result);
  print (result1);
}
