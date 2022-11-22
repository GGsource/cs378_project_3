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
            titledTile("Animation 1", "desc 1"),
            titledTile("Animation 2", "desc 2"),
            titledTile("Animation 3", "desc 3"),
            titledTile("Animation 4", "desc 4"),
            titledTile("Animation 5", "desc 5"),
            titledTile("Animation 6", "desc 6"),
            titledTile("Animation 7", "desc 7"),
            titledTile("Animation 8", "desc 8"),
          ],
        ),
      ),
    );
  }

  ListTile titledTile(String title, String desc) {
    return ListTile(
      leading: const Icon(Icons.workspaces),
      title: Text(title),
      onTap: () => screenTransition(title, desc),
    );
  }

  Future<dynamic> screenTransition(String title, String desc) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation) {
          return AnimationRoute(
            title: title,
            description: desc,
          ); //Should take different things based on which screen it is
        },
        barrierColor: Colors.blue,
        transitionDuration: Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
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
}
