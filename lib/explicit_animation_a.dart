import 'package:flutter/material.dart';

class ExplicitAnimationA extends StatefulWidget {
  final int index;
  final int duration;
  final String imagePath;
  const ExplicitAnimationA({
    super.key,
    required this.index,
    required this.duration,
    required this.imagePath,
  });

  @override
  State<ExplicitAnimationA> createState() => _ExplicitAnimationAState();
}

class _ExplicitAnimationAState extends State<ExplicitAnimationA>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _sizeAnimation = Tween<double>(begin: 50, end: 270).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    return Column(
      children: [
        Container(
          height: _sizeAnimation.value,
          width: _sizeAnimation.value,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.imagePath))),
        ),
        Wrap(
          spacing: 30,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: index % 2 == 0 ? playPauseAnim : null,
                onLongPress: index % 2 == 0 ? playPauseAnim : null,
                child: const Text("Play/Pause")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: index % 2 == 0 ? _reverse : null,
                onLongPress: index % 2 == 0 ? _reverse : null,
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
