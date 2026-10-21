class User {
  String name;
  String? email;
  int age;

  User(this.name, this.age); // добавил this.age в конструктор
}

String domainOf(User u) {  // добавил переменную и обработал вариант с нулл
  final email = u.email;
  if (email == null) {
    return '';
  } else {
    return email.split('@').last;
  }
}

int nameLength(String? name) {  // если нулл то просто возвращаем 0
  return name?.length ?? 0;
}

void main() {
  String? city; // вернем нулл если значение так и не появится
  print(city);

  int? bonus;
  int total = 100 + (bonus ?? 0);//если бонуса нет, то это 0 - добавил в код
  print(total);

  List<String> tags = [];//обычно создаем пустые списки чтобы их потом наполнять
  print(tags.length);

  final users = [User('Иван', 35)]; // добавил возраст
  final found = users.where((u) => u.age > 40).firstOrNull;
  if (found == null) {
    print('Нет пользователей старше 40');// случай, когда ни один из пользователей не старше условия
  } else {
    print(found.name);
  }
}
