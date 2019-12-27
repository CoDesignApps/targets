import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:targets/components/flies/fly.dart';
import 'package:targets/targetGameLoop.dart';

class MachoFly extends Fly {
  double get speed => game.tileSize * 8;

  MachoFly(TargetGameLoop game, double x, double y) : super(game) {
   
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}