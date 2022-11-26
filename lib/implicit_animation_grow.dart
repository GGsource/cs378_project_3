import 'package:flutter/material.dart';

class AnimatedGrow extends StatefulWidget {
  const AnimatedGrow({super.key});

  @override
  State<AnimatedGrow> createState() => _AnimatedGrowState();
}

class _AnimatedGrowState extends State<AnimatedGrow> {
  bool isEnded = false;
  double scale1 = 1;
  double scale2 = 1.05;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isEnded ? scale1 *= scale2 : scale2 *= scale1;
        isEnded = !isEnded;
      }),
      child: AnimatedScale(
        scale: isEnded ? scale1 : scale2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: Image.asset(
          "images/balloon.webp",
          height: 200,
        ),
      ),
    );
  }
}
