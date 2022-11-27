import 'package:flutter/material.dart';

class ExplicitAnimationC extends StatefulWidget {
  const ExplicitAnimationC({super.key});

  @override
  State<ExplicitAnimationC> createState() => _ExplicitAnimationCState();
}

class _ExplicitAnimationCState extends State<ExplicitAnimationC>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(.75, 0))
            .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/soccerball.png"))),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/goalpost.png"))),
            ),
          ],
        ),
        Wrap(
          spacing: 30,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: playPauseAnim,
                child: const Text("Play/Pause")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: _reverse,
                child: const Text("Rewind")),
          ],
        ),
      ],
    );
  }

  bool isForward = true;

  void playPauseAnim() {
    if (_controller.isAnimating) {
      _pause();
    } else {
      _play();
    }
  }

  void _play() {
    _controller.status == AnimationStatus.dismissed || isForward
        ? _controller.forward()
        : _controller.reverse();
  }

  void _pause() {
    isForward = _controller.status == AnimationStatus.forward ? true : false;
    _controller.stop();
  }

  void _reverse() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    }
  }
}
