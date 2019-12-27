import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:targets/targetGameLoop.dart';

class HomeView {
  final TargetGameLoop game;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.game) {
    titleRect = Rect.fromLTWH(
      game.tileSize,
      (game.size.height / 2) - (game.tileSize * 4),
      game.tileSize * 7,
      game.tileSize * 4,
    );
    titleSprite = Sprite('branding/title.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);

  }

  void update(double t) {}
}