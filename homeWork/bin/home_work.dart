import 'dart:io';

import 'package:home_work/home_work.dart' as home_work;
int findMax (List <int> numbers){
int max = 0;
for (int number in numbers){
 if (number > max){
  max = number;
 } 
}
return max;
}
void main(){
int result = findMax([1,5,7,11,2,3,2,2,4]);
print(result);
}
