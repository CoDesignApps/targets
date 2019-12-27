import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:targets/targetGameLoop.dart';
import 'package:targets/views/view.dart';

class CreditsButton {
  final TargetGameLoop game;
  Rect rect;
  Sprite sprite;

  CreditsButton(this.game) {
    rect = Rect.fromLTWH(
      game.size.width - (game.tileSize * 1.25),
      game.size.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
    sprite = Sprite('ui/icon-credits.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.credits;
  }
}