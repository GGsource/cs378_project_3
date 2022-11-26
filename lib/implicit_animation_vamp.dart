import 'package:flutter/cupertino.dart';

class AnimatedCham extends StatefulWidget {
  const AnimatedCham({super.key});

  @override
  State<AnimatedCham> createState() => _AnimatedChamState();
}

class _AnimatedChamState extends State<AnimatedCham> {
  bool isEnded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isEnded = !isEnded;
      }),
      child: AnimatedOpacity(
        opacity: isEnded ? 0 : 1,
        duration: const Duration(milliseconds: 2500),
        curve: Curves.easeOutCubic,
        child: Image.asset(
          "images/chameleon.png",
          height: 330,
        ),
      ),
    );
  }
}
