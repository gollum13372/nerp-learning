import 'package:spravochnik/spravochnik.dart' as spravochnik;

void main() {
  Map <String, String> contacts = {
    'Миша': '+7 911-111-22-33',
    'Лиза': '+7 911-222-22-33',
    'Ваня': '+7 911-333-22-33',
    'Филя': '+7 911-444-22-33',
    'Лена': '+7 911-555-22-33',
    'Максим': '+7 666-111-22-33',
  };
  print(number(contacts,'Миша'));
  print(number(contacts, "Slavik"));
}
String number(Map<String, String> contacts, String name){
  String? phone = contacts[name];
  if (phone == null){
    return 'Контакт не найден';
  }
  return '$name: $phone';
}

