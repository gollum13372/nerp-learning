import 'dart:io';

final contacts = <String, String>{}; // имя -> телефон

void main() {
  while (true) {
    print('=== Телефонная книга ===');
    print('1. Добавить контакт');
    print('2. Найти контакт');
    print('3. Удалить контакт');
    print('4. Показать все');
    print('5. Выход');
    stdout.write('Выберите пункт: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addContact();
        break;
      case '2':
        searchContact();
        break;
      case '3':
        deleteContact();
        break;
      case '4':
        viewAllContacts();
        break;
      case '5':
        print('Всего хорошего');
        return;
      default:
        print('Нет такой команды');
    }
  }
}

void addContact() {
  stdout.write('Введите имя: ');
  final name = stdin.readLineSync()?.trim() ?? '';

  if (name.isEmpty) {
    print('Имя не может быть пустым');
    return;
  }

  if (contacts.containsKey(name)) {
    print('Контакт с таким именем уже существует');
    return;
  }

  stdout.write('Введите номер телефона: ');
  final phone = stdin.readLineSync()?.trim() ?? '';
  if (RegExp(r'^[0-9 +/-]{5,}$').hasMatch(phone)){

  contacts[name] = phone;
  print('Контакт "$name" добавлен');
  } else {
    print('Можно использовать только цифры и +/-');
  }
}

void searchContact() {
  stdout.write('Введите имя: ');
  final name1 = stdin.readLineSync()?.trim() ?? '';

  if (name1.isEmpty) {
    print('Пустой запрос');
    return;
  }

  final lowerName = name1.toLowerCase();

  final matches = <String, String>{};// словарь для подошедших контактов
  for (final entry in contacts.entries) {//перебираем все записанные контакты
    if (entry.key.toLowerCase().startsWith(lowerName)) {//проверяем начинается ли наш запрос также как контакты
      matches[entry.key] = entry.value;// да = копируем в наш новый список
    }
  }

  if (matches.isEmpty) {
    print('Контакт не найден');
    return;
  }

  print('Найдено: ${matches.length}');
  matches.forEach((name, phone) {
    print('$name: $phone');
  });
  print('');
}

void deleteContact() {
  stdout.write('Введите имя для удаления: ');
  final name = stdin.readLineSync()?.trim() ?? '';

  if (contacts.remove(name) != null) {
    print('Контакт "$name" удалён');
  } else {
    print('Контакт не найден');
  }
}

void viewAllContacts() {
  if (contacts.isEmpty) {
    print('Список пуст');
    return;
  }
  print('--- Все контакты ---');
  contacts.forEach((name, phone) {
    print('$name: $phone');
  });
  print('');
}