import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:targets/targetGameLoop.dart';

class Backyard {
  final TargetGameLoop game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
              0,
              game.size.height - (game.tileSize * 23),
              game.tileSize * 9,
              game.tileSize * 23,
);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}