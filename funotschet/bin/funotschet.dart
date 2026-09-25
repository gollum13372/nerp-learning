import 'package:funotschet/funotschet.dart' as funotschet;
void fun(int q){
  String result ='';
  for (int i = q; i>0; i--){
    if (i == 4){
      continue;
    }
    result = result + '$i ';
  //print(result);
  //print('Поехали');
  
}
print('$result'+'Поехали!');
}
void main(List<String> arguments) {
  fun(10);
  fun(20);

}
