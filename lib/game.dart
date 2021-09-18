import 'package:collection/collection.dart';

class Game {
  final String title;
  final String format;
  final String image;
  //final GameScore score;

  const  Game(this.title, this.format, this.image);//, this.score);

}

class EndScore {
  num endNumber;
  List<num> scores;
  num endTotal;
  num tens;
  num xs;
}

class GameScore {
  num ends;
  num arrowCount;
  num endScore = 0;
  num roundOneScore = 0;
  num roundTwoScore = 0;
  num total = 0;
  //List<EndScore> endScores;

  void getTotal() {
    this.total = this.roundOneScore + this.roundTwoScore;
  }

  void getEndScores(int end){

  }

  void getIndoorRoundOneScores() {
   // for()
  }

  void getOutdoorRoundScores() {
    /*Iterable<num> firstRound = endScores.getRange(0, 5);
    Iterable<num> secondRound = endScores.getRange(6,12);
    roundOneScore = firstRound.sum;
    roundTwoScore = secondRound.sum;*/
  }


}




