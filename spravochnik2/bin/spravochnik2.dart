void main() {
  final contacts = [
    {'name': 'Миша', 'number': '+7 911-111-22-33'},
    {'name': 'Лиза', 'number': '+7 911-222-22-33'},
    {'name': 'Ваня', 'number': '+7 911-333-22-33'},
    {'name': 'Филя', 'number': '+7 911-444-22-33'},
    {'name': 'Лена', 'number': '+7 911-555-22-33'},
    {'name': 'Максим', 'number': '+7 666-111-22-33'},
  ];
  final qwert = 'ли';
  contacts.sort((a,b) => a['name']!.compareTo(b['name']!));
 // print(contacts.map((c)=> '${c['name']}: ${c['number']}').join('\n'));
 //тут мы выводили весь список целиком
  print(contacts
  .where((c)=> c['name']!.toLowerCase().contains(qwert.toLowerCase()))
  .map((c)=> '${c['name']}: ${c['number']}')
  .join('\n'));
  
  }

  



/*String number(Map<String, String> contacts, String name){
  String? phone = contacts[name];
  if (phone == null){
    return 'Контакт не найден';
  }
  return '$name: $phone';
}
*/