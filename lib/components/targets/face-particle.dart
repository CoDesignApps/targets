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

class FaceParticle extends SpriteComponent {
  final TargetGameLoop game;
  Random rnd;
   

  //Sprite bgSprite;
  //Rect bgRect;

  FaceParticle(this.game) {
    rnd = Random();
    SpriteComponent.rectangle(44, 66, 'faces/adis.png');

  }

  void render(Canvas c) {
  //sprite.render(c);
  }

  void update(double t) {

  }
}