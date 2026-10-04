int sumReduce (List<int> massiv){
  int summaR = massiv.reduce((a,b) => a+b);
  return summaR;
}
int sumFold (List<int> massiv){
  int summaF = massiv.fold(0, (a, b) => a+b);
  return summaF;
}
void main() {
  List<int> massiv = [1,5,9,6];
  int result = sumReduce(massiv);
  int result2 = sumFold(massiv);
  print(result);
  print(result2);
}
