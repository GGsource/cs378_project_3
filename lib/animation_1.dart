import 'package:flutter/material.dart';

class AnimationOne extends StatefulWidget {
  final int index;
  const AnimationOne({super.key, required this.index});

  @override
  State<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends State<AnimationOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _sizeAnimation = Tween<double>(begin: 24, end: 72).animate(_controller);
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(_sizeAnimation.value / 2),
          ),
        ),
        Wrap(
          spacing: 30,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: index % 2 == 0 ? playPauseAnim : null,
                onLongPress: index % 2 == 0 ? playPauseAnim : null,
                child: Text("Play/Pause")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: index % 2 == 0 ? _reverse : null,
                onLongPress: index % 2 == 0 ? _reverse : null,
                child: Text("Rewind")),
          ],
        ),
      ],
    );
  }

  void playPauseAnim() {
    if (_isPlaying()) {
      _pause();
    } else {
      _play();
    }
  }

  void _play() {
    _controller.forward();
  }

  void _pause() {
    _controller.stop();
  }

  void _reverse() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    }
  }

  bool _isPlaying() {
    return _controller.isAnimating;
  }
}
