import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:targets/targetGameLoop.dart';
import 'package:targets/views/view.dart';

class StartButton {
  final TargetGameLoop game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
    game.tileSize * 1.5,
    (game.size.height * .75) - (game.tileSize * 1.5),
    game.tileSize * 6,
    game.tileSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {
    game.activeView = View.playing;
    game.flySpawner.start();
    game.gameStarted = true;
  }
}