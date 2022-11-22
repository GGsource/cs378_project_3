import 'package:flutter/material.dart';

class AnimationRoute extends StatelessWidget {
  const AnimationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Route"),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                child: Row(
              children: const [
                Text("Description"),
                Icon(Icons.abc),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
