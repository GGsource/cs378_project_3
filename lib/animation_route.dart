import 'dart:math';

import 'package:cs378_project_3/explicit_animation_a.dart';
import 'package:cs378_project_3/explicit_animation_b.dart';
import 'package:cs378_project_3/implicit_animation_grow.dart';
import 'package:cs378_project_3/implicit_animation_sniff.dart';
import 'package:cs378_project_3/implicit_animation_cham.dart';
import 'package:flutter/material.dart';

class AnimationRoute extends StatelessWidget {
  final String screenTitle;
  final String animationTitle;
  final String description;
  final int index;
  const AnimationRoute(
      {Key? key,
      required this.screenTitle,
      required this.animationTitle,
      required this.description,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: Column(
                    children: [
                      Text(
                        animationTitle,
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.amberAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    index < 6
                        ? fetchImplicitAnimation()
                        : fetchExplicitAnimation(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fetchImplicitAnimation() {
    // index is even so this is an implicit animation
    switch (index) {
      case 1:
        return TweenAnimationBuilder(
          duration: const Duration(seconds: 15),
          tween: Tween<double>(begin: 0, end: 800 * pi),
          builder: (_, double angle, __) {
            // Animation value should be same type as Tween typ
            return Transform.rotate(
                angle: angle,
                child: Image.asset(
                  "./images/sonic.webp",
                  height: 300,
                ));
          },
          curve: Curves.decelerate,
        );
      case 2:
        return const AnimatedSniff();
      case 3:
        return TweenAnimationBuilder(
          duration: const Duration(seconds: 3),
          tween: Tween<double>(begin: 0, end: 130),
          builder: (_, double offset, __) {
            // Animation value should be same type as Tween typ
            return Transform.translate(
                offset: Offset(0, offset),
                child: Image.asset(
                  "./images/ton.png",
                  height: 200,
                ));
          },
          curve: Curves.easeInOutBack,
        );
      case 4:
        return const AnimatedCham();
      case 5:
        return const AnimatedGrow();
      default:
        return const Icon(
          Icons.ten_k_outlined,
          size: 300,
        );
    }
  }

  Widget fetchExplicitAnimation() {
    switch (index) {
      case 6:
        return ExplicitAnimationA(
          index: index,
          duration: 3000,
          imagePath: "images/heart.png",
        );
      case 7:
        return ExplicitAnimationB();
      case 8:
        return ExplicitAnimationB();
      default:
        return FlutterLogo();
    }
  }
}
