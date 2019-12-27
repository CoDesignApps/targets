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

class TargetParticles extends Component {
  final TargetGameLoop game;
  double particleSize;
  Paint particlePaint = Paint()..color = Colors.red;
  Random rnd;
  CircleParticle cParticle;


  //Sprite bgSprite;
  //Rect bgRect;

  TargetParticles(this.game) {
    rnd = Random();
    particleSize = game.tileSize;
    cParticle = CircleParticle(paint: particlePaint, radius: particleSize * rnd.nextDouble() * 2, lifespan: 2000 );

/*
    game.add(ParticleComponent(
        particle: cParticle
    ));

    game.add(
    ParticleComponent(
        particle: Particle.generate(
            count: 10,
            generator: (i) => AcceleratedParticle(
                acceleration: Offset(
                              rnd.nextDouble() * 200 - 100, 
                              rnd.nextDouble() * 200 - 100,
                          ),
                child: CircleParticle(
                    paint: Paint()..color = Colors.red
                )
            )
        )
    )    
);      
*/
  }

  void render(Canvas c) {
  cParticle.render(c);
  }

  void update(double t) {

  }
}