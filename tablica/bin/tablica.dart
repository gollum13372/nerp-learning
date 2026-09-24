import 'package:tablica/tablica.dart' as tablica;
import 'dart:io';
void main(List<String> arguments) {
  for (int i= 1; i <= 9; i++){
   String stroka = '';
   
   for (int j =1; j <=9; j++){
    int c = i*j;
    String d = c.toString();
    stroka = stroka + ' ' + d;
   }print(stroka);
  }
} 
