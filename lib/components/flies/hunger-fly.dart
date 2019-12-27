import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:targets/components/flies/fly.dart';
import 'package:targets/targetGameLoop.dart';

class HungryFly extends Fly {
  HungryFly(TargetGameLoop game, double x, double y) : super(game) {
    
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}