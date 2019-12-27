import 'dart:ui';
import 'package:targets/targetGameLoop.dart';
import 'package:flame/sprite.dart';

class Fly {
  final TargetGameLoop game;
  Rect flyRect;
  
  // Fly state
  bool isDead = false;
  bool isOffScreen = false;

  // Sprite Definitions
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  double get speed => game.tileSize * 10;

  Offset targetLocation;

  // new constructor
  Fly(this.game) {
    setTargetLocation();
  }

  void setTargetLocation() {
  double x = game.rnd.nextDouble() * (game.size.width - (game.tileSize * 2.025));
  double y = game.rnd.nextDouble() * (game.size.height - (game.tileSize * 2.025));
  targetLocation = Offset(x, y);
}

  void render(Canvas c) {

    if(isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
       flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }

  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.size.height) {
        isOffScreen = true;
      }
    } else {
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
      flyingSpriteIndex -= 2;

      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      if(stepDistance < toTarget.distance) {
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
      }
    }
    
  }

  void onTapDown() {
    isDead = true;
  }
}
