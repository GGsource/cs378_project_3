import 'package:cs378_project_3/animation_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text("Animation 1"),
              onTap: () => screenTransition(context),
            ),
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text("Animation 2"),
              onTap: () => screenTransition(context),
            ),
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text("Animation 3"),
              onTap: () => screenTransition(context),
            ),
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text("Animation 4"),
              onTap: () => screenTransition(context),
            ),
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text("Animation 6"),
              onTap: () => screenTransition(context),
            ),
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text("Animation 7"),
              onTap: () => screenTransition(context),
            ),
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text("Animation 8"),
              onTap: () => screenTransition(context),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> screenTransition(BuildContext ctx) {
  return Navigator.of(ctx).push(
    PageRouteBuilder(
      pageBuilder: (ctx, animation, anotherAnimation) {
        return AnimationRoute(); //Should take different things based on which screen it is
      },
      barrierColor: Colors.blue,
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (ctx, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.easeOut, parent: animation);
        return RotationTransition(
          turns: animation,
          child: child,
        );
        // return SlideTransition(
        //   position:
        //       Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
        //           .animate(animation),
        //   child: child,
        // );
      },
    ),
  );
}
