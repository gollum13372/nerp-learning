
  void main(List<String> arguments) {
    List<String> massiv = ['1','2','3','x'];
    int result = massiv.map(int.tryParse).whereType<int>().reduce((a,b)=> a+b);
    print(result);
    
  }
