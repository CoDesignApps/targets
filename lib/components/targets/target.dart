import 'dart:math';
import 'dart:ui';

import 'package:flame/components/particle_component.dart';
import 'package:flutter/material.dart';

class Target {
  Color goodColor;
  Color evilColor;
  Color targetColor;
  bool isEvil;
  int goodPoint;
  int evilPoint;
  double size;
  Offset offset; // coordinates
  double maxXoffset;
  double maxYoffset;
  Duration evilModeDuration;

  ParticleComponent particleComponent;
  
  // more variables
  double speed;
  double direction;
  bool isTouched;

  // TODO: generate Vector, derived from speed and direction

  Target({
    this.goodColor = Colors.green,
    this.evilColor = Colors.red,
    this.goodPoint = 1,
    this.size = 50,
    this.maxXoffset,
    this.maxYoffset,
    this.isEvil = false,
    this.evilModeDuration,
    this.evilPoint = 0,
  }) {
    evilModeDuration = Duration(milliseconds: 500);
  }

  // TODO: Remove from here, this function should now be controll directly by LevelStateController
  void nextAction() {
    // small change of target becoming evil when it's hit
    bool shouldBecomeEvil = (Random().nextInt(3) == 1 && !isEvil);
    isEvil = shouldBecomeEvil ? true : false;
    moveRandom();
    if (isEvil) startEvilTimer();
  }


  void startEvilTimer() {
    // evilPoint = 1;
    Future.delayed(evilModeDuration, () {
      // evilPoint = 0;
      nextAction();
    });
  }




// TODO: Move function to TargetStateController
  void moveRandom() {
    double x = Random().nextDouble() * maxXoffset;
    double y = Random().nextDouble() * maxYoffset;
    offset = Offset(x, y);
  }

  Color get color => isEvil ? evilColor : goodColor;
}

void render(Canvas c){

}

void update(double t) {

}


