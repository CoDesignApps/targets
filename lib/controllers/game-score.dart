import 'package:targets/targetGameLoop.dart';

class GameScore {

int currentLevelScore;
int currentGameScore;

GameScore() {

  currentLevelScore = 0;
  currentGameScore = 0;
  }

  void calcGameScore() {
    currentGameScore += currentLevelScore;
  }

}