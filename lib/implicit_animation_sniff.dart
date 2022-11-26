import 'package:flutter/cupertino.dart';

class AnimatedSniff extends StatefulWidget {
  const AnimatedSniff({super.key});

  @override
  State<AnimatedSniff> createState() => _AnimatedSniffState();
}

class _AnimatedSniffState extends State<AnimatedSniff> {
  bool isEnded = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          isEnded = !isEnded;
        });
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutBack,
        onEnd: (() {
          setState(() {
            isEnded = !isEnded;
          });
        }),
        width: isEnded ? 400 : 300,
        height: isEnded ? 300 : 200,
        child: Image.asset("images/sniffer.jpg"),
      ),
    );
  }
}
