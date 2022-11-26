import 'package:cs378_project_3/animation_1.dart';
import 'package:flutter/material.dart';

class AnimationRoute extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  const AnimationRoute(
      {Key? key,
      required this.title,
      required this.description,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
                  child: Text(description)),
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
                    AnimationOne(index: index),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
