class Kelvin{
  double celsius;

  Kelvin(this.celsius);
  Kelvin.fromKelvin(double k) : celsius = k-273.15;
  double get _isFreezing => celsius+273.15;

  @override
  String toString() =>
  '${_isFreezing.toStringAsFixed(2)} по Кельвину : ${celsius.toStringAsFixed(2)} по Цельсию';
}

void main(){

final a = Kelvin(23);
final b = Kelvin.fromKelvin(300);
print(a);
print(b);


}