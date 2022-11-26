import 'dart:math';

import 'package:cs378_project_3/explicit_animation_a.dart';
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
                    index % 2 != 0
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
        );
      case 3:
        return Icon(
          Icons.three_k_outlined,
          size: 300,
        );
      case 5:
        return Icon(
          Icons.five_k_outlined,
          size: 300,
        );
      case 7:
        return Icon(
          Icons.seven_k_outlined,
          size: 300,
        );
      default:
        return Icon(
          Icons.ten_k_outlined,
          size: 300,
        );
    }
  }

  Widget fetchExplicitAnimation() {
    return ExplicitAnimationA(
      index: index,
      duration: 3000,
      imagePath: "images/heart.png",
    );
  }
}
