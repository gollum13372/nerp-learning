enum GameResult{
  playerWin,
  dillerWin,
  draw;
}
class Stats {
final List<GameResult> _partsPlayer =[];
final List<int> _scorePlayer =[];

void record(GameResult result, int score){
  _partsPlayer.add(result);
  _scorePlayer.add(score);
}
int get games => _partsPlayer.length;

int get wins => _partsPlayer.where((win) => win == GameResult.playerWin).length;

int get losses => _partsPlayer.where((loss) => loss == GameResult.dillerWin).length;

int get draws => _partsPlayer.where((draw) => draw == GameResult.draw).length;



}