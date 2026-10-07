class Counter {
  int _value = 0;
  final int _max;
  Counter(this._max);
  int get value => _value;


  void increment() {
    if (_value < _max){
    _value++;
    }
  }

  void decrement() {
    if (_value > 0) {           
      _value--;
    }
  }
  void reset(){
    _value = 0;
  }
  @override
  String toString() => 'Счётчик: $_value из $_max'; 
}

void main(){

  final counter = Counter(10);
  
  for (int i = 0; i < 15; i++){
    counter.increment();
    print(counter._value);
    counter.increment();
    print(counter._value);
    counter.decrement();
    print(counter._value);
    counter.increment();
    print(counter._value);
    counter.increment();
    print(counter._value);
    counter.decrement();
    print(counter._value);
    counter.increment();
    print(counter._value);
    counter.increment();
    print(counter._value);
    counter.decrement();
    print(counter._value);
  }
  print(counter);

}