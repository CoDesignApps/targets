import 'package:targets/targetGameLoop.dart';
import 'package:targets/components/targets/target-particle.dart';


class TargetSpawner {
  final TargetGameLoop game;
  final int maxSpawnInterval = 1000;
  final int minSpawnInterval = 150;
  final int intervalChange = 3;
  final int maxTargetsOnScreen = 7;
  int currentInterval;
  int nextSpawn;

  TargetSpawner(this.game) {
    start();
    game.spawnTarget();

  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;

  }

  void killAll() {
    game.targets.forEach((TargetParticle tp) => tp.isDead = true); 
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingTargets = 0;
    game.targets.forEach((TargetParticle tp) {
      if (!tp.isDead) livingTargets += 1;
    });

    if (nowTimestamp >= nextSpawn && livingTargets < maxTargetsOnScreen) {
      game.spawnTarget();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }
}