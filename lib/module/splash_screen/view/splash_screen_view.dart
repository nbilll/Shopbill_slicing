import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../controller/splash_screen_controller.dart';
import 'package:shopbils/core.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Center(
            child: Image.asset(
              "assets/icon/icon.png",
              fit: BoxFit.fill,
              width: 120,
              height: 120,
            ).animate().fadeIn(
                  duration: 2000.ms,
                ),
          ),
        );
      },
    );
  }
}
