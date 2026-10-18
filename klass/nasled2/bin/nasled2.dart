

abstract class Employee{
final String name;

Employee(this.name);

int monthPay();

@override
String toString() => 'Сотрудник - $name : зарплата - ${monthPay()}';
}

class SalariedEmployee extends Employee{
  final int salary;

  SalariedEmployee(super.name, this.salary);


  @override
  int monthPay() => salary; // сколько заплатим окладнику
  }

class HourlyEmployee extends Employee{
  final int rate;
  final int hours;

  HourlyEmployee(super.name, {required this.rate, required this.hours});

  @override
  int monthPay() => rate*hours; //сколько платим по часовой
}
class Project{//нужен чтобы потом фрилансер получил денег
  final String title;
  final int cost;

  Project(this.title, this.cost);

}
class Freelancer extends Employee{
final List<Project> projects;

Freelancer(super.name, this.projects);
@override
int monthPay() => projects.fold(0,(sum, project)=> sum + project.cost);//сколько платим за проекты
  
}


void main(){
  final ivan = SalariedEmployee('Иван', 150000);
  final boryan = HourlyEmployee('Боря', rate: 500, hours: 176);
  final egor = Freelancer('Егор', [Project('game', 80000), Project('vpn', 120000)]);
  final gosha = SalariedEmployee('George', 80000);
  final zheka = HourlyEmployee('Evgeni', rate: 350, hours: 216);
  List<Employee> staff = [ivan,boryan,egor,gosha,zheka];//список сотрудников
  final fot = staff.fold(0,(sum,staff)=> sum+staff.monthPay());//общие затраты на сотрудников

  staff.sort((a, b) => b.monthPay().compareTo(a.monthPay()));// теперь на первом индексе у нас стоит самая большая зп

  List<Employee> hourlyStaff = staff.whereType<HourlyEmployee>().toList(); // Создал список почасовиков
  final double midleCost = hourlyStaff.fold(0, (sum, hourly)=> sum+hourly.monthPay())/hourlyStaff.length;//средняя зп часовиков
  List<Employee> overFarm = staff.where((a,)=> a.monthPay()>100000).toList();//создали список богачей

  
  
}