import 'dart:math';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/components/particle_component.dart';
import 'package:flame/particle.dart';
import 'package:flame/particles/accelerated_particle.dart';
import 'package:flame/particles/circle_particle.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:targets/targetGameLoop.dart';

class TargetParticle extends PositionComponent {
  bool isDead = false;
  bool isOffScreen = false;
  final TargetGameLoop game;

  Offset targetLocation;
  Offset randomNextTargetLocation;
  double particleSize;
  Paint particleAlivePaint = Paint()..color = Colors.green;
  Paint particleDeadPaint = Paint()..color = Colors.red;
  Paint targetPaint;
  Random rnd;
  //CircleParticle cParticle;
  //Container container;
  //Sprite bgSprite;
  Rect targetRect;

  TargetParticle(this.game) {
    rnd = Random();
    particleSize = game.tileSize * 0.7;
    targetLocation = nextTargetLocation();
    randomNextTargetLocation = nextTargetLocation();
    targetPaint  = particleAlivePaint;
    targetRect = Rect.fromCircle(center: targetLocation, radius: particleSize); 
    
  }



  double get speed => game.tileSize * 3;

  void render(Canvas c) {
  //cParticle.render(c);
  c.drawCircle(targetLocation, particleSize, targetPaint);
  }

  void update(double t) {
    // apply translation on rectangle and transfer to Circle location via offset
    targetRect = Rect.fromCircle(center: targetLocation, radius: particleSize);  
  
     // if dead, let the target fall off screen
     if (isDead) {
      // print('is dead: $isDead');

        targetRect = targetRect.translate(0, game.tileSize * 12 * t);
        if (targetRect.top > game.size.height) {
          isOffScreen = true;
        }
        targetLocation = targetRect.center;
         
      // If not Dead, then move it around
      } else {
      

      double stepDistance = speed * t  ;
        
      Offset toTarget = randomNextTargetLocation - Offset(targetRect.left, targetRect.top);
      if(stepDistance < toTarget.distance) {
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        targetRect = targetRect.shift(stepToTarget);
            targetLocation = targetRect.center;
      } else {
        targetRect = targetRect.shift(toTarget);
        targetLocation = targetRect.center;
        randomNextTargetLocation =nextTargetLocation();
      }
      }
    } 
      
      


  Offset nextTargetLocation()
  {
    double x = rnd.nextDouble() * (game.size.width - (game.tileSize * 2.025));
    double y = rnd.nextDouble() * (game.size.height - (game.tileSize * 2.025));
    return Offset(x,y);

  }

  void onTapDown() {
    isDead = true;
    targetPaint = particleDeadPaint;
  
  }

  
}