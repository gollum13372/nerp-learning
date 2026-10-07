class Student{
  final String name;
  final List<int> _grades = [];
  
  Student(this.name);

  bool addGrade(int grade){
    if (grade < 1 || grade > 5){
      return false;
    }
    _grades.add(grade);
    return true;
  }
  int get sum => _grades.fold(0, (a, b) => a+b);
  double get avarage => sum/_grades.length;

  bool get twoGrade => _grades.any((grade) => grade == 2);
  String _yesNo(bool twoGrade) => twoGrade ? 'да' : 'нет';

  @override
  String toString() => '$name: средний бал ${avarage.toStringAsFixed(1)}, есть ли двойки - ${_yesNo(twoGrade)}';

}

void main(){
  final anna = Student('Anna');
  anna.addGrade(3);
  anna.addGrade(3);
  anna.addGrade(4);
  anna.addGrade(8);
  print(anna);
}