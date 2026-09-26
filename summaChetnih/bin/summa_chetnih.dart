import 'package:summa_chetnih/summa_chetnih.dart' as summa_chetnih;

void main(){
  List<int> a = [3, 8, 12, 5, 7, 20];
  var b = 0;   
  int sum = a.where((n) => n % 2 == 0).fold(0,(b, n) => b+n);
  print(sum);
}
