import 'dart:io';


List<int> evens (List<int> numbers){
  List<int> result = [];
  for (int num in numbers){
    if (num % 2 == 0){
      result.add(num);
    }
  }
  return result;
}
void main(){
print(evens([1,2,3,4,5,6,7,8,9]));
}
