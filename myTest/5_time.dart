void main() {
  int time = 9876;
  int hh = time ~/ 3600;
  int mm = (time % 3600) ~/ 60;
  int ss = time % 60;
  String hh1 = hh.toString().padLeft(2, '0');
  String mm1 = mm.toString().padLeft(2, '0');
  String ss1 = ss.toString().padLeft(2, '0');
  print('время $hh1:$mm1:$ss1');
}