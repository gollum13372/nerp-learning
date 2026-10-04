List<int> kvadrat(List<int> massiv){
  List<int> qqq = massiv.map((x) => x*x).toList();
  return qqq;
}
void main() {
  List<int> massiv = [1,2,3,4,5,6,7,8,9];
  List<int> result =kvadrat(massiv); 
  print(result);
}
