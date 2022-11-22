import 'package:flutter/material.dart';

class AnimationRoute extends StatelessWidget {
  final String title;
  final String description;
  const AnimationRoute(
      {Key? key, required this.title, required this.description})
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
            Flexible(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: Text(description)),
            ),
            Flexible(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.amberAccent,
                  child: const Icon(
                    Icons.abc,
                    size: 120,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
