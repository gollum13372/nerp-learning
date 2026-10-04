
void main() {
  List<int> massiv = [1,2,3,4,5,6,7,8,9,10,11];
  int sumKvadratovChetnih = massiv.where((x) => x % 2 == 0).map((y) => y*y).reduce((a,b) => a+b);
  print(sumKvadratovChetnih);
}
