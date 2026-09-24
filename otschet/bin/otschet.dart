import 'package:otschet/otschet.dart' as otschet;

void main(List<String> arguments) {
  String result ='';
  for (int i = 10; i>0; i--){
    if (i == 4){
      continue;
    }
    result = result + '$i ';
  }
  //print(result);
  //print('Поехали');
  print('$result'+'Поехали!');
}
