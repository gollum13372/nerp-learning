
class Stats {
final List<String> _partsPlayer =[];
final List<int> _scorePlayer =[];

void record(String result, int score){
  _partsPlayer.add(result);
  _scorePlayer.add(score);
}
int get games => _partsPlayer.length;

int get wins => _partsPlayer.where((win) => win == 'Победа игрока').length;

int get losses => _partsPlayer.where((loss) => loss == 'Победа диллера').length;

int get draws => _partsPlayer.where((draw) => draw == 'Ничья').length;



}