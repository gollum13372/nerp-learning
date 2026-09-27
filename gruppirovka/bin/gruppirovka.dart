import 'package:gruppirovka/gruppirovka.dart' as gruppirovka;

void main(List<String> arguments) {
  List <String> names = ['Марина', 'Миша', 'Игорь', 'Илья', 'Валера'];
  var group = <String, List<String>>{
    'И':[],
    'М':[],
    'В':[],
  };
  names.forEach((name)=> group[name[0]]?.add(name));
  print (group);
  

  
}
