import 'dart:async';
import 'dart:math';
import 'package:flame/src/components/router/route.dart' as FlameRoute;
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../models/fruit_model.dart';
import '../routes/game_over_page.dart';
import '../routes/game_page.dart';
import '../routes/home_page.dart';
import '../routes/pause_game.dart';

class FruitsSliceScreen extends StatelessWidget {
  const FruitsSliceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Flame.device.fullScreen(),
      builder: (context, snapshot) {
        return Scaffold(
          body: GameWidget(
            game: BalloonBlastGame(), // Create an instance of your game
          ),
        );
      },
    );
  }
}

//Extending FlameGame instead of the abstract Game class
class BalloonBlastGame extends FlameGame {
  late RouterComponent router;
  late double maxVerticalVelocity;

  final List<FruitModel> fruits = [
    FruitModel(image:"apple.png"),
    FruitModel(image:"banna.png"),
    FruitModel(image:"bomb.png", isBomb: true),
    FruitModel(image:"orange.png"),
    FruitModel(image:"peach.png"),
    FruitModel(image:"pipeapple.png"),
    FruitModel(image:"strawberry.png"),
  ];




  @override
  Future<void> onLoad() async {
    await super.onLoad();

    for (final fruit in fruits) {
      await images.load(fruit.image);
    }

    // Initialize router
    router = RouterComponent(
      initialRoute: 'home',
      routes: {
        'home': FlameRoute.Route(HomePage.new),
        'game-page': FlameRoute.Route(GamePage.new),
        'pause': PauseRoute(),
        'game-over':GameOverRoute(),
      },
    );

    // Load background parallax
    final parallax = await ParallaxComponent.load(
      [
        ParallaxImageData('bg.png'),
      ],
      baseVelocity: Vector2(0, 0),
    );

    addAll([
      parallax,
      router,
    ]);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    getMaxVerticalVelocity(size);
  }

  void getMaxVerticalVelocity(Vector2 size) {
    maxVerticalVelocity = sqrt(
      2 * (AppConfig.gravity.abs() + AppConfig.acceleration.abs()) *
          (size.y - AppConfig.objSize * 2),
    );
  }
}
