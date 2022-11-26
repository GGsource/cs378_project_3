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
            titledTile("desc 1", 1),
            titledTile("desc 2", 2),
            titledTile("desc 3", 3),
            titledTile("desc 4", 4),
            titledTile("desc 5", 5),
            titledTile("desc 6", 6),
            titledTile("desc 7", 7),
            titledTile("desc 8", 8),
          ],
        ),
      ),
    );
  }

  ListTile titledTile(String desc, int ndx) {
    return ListTile(
      leading: const Icon(Icons.workspaces),
      title: Text("Animation $ndx"),
      onTap: () => screenTransition(desc, ndx),
    );
  }

  Future<dynamic> screenTransition(String desc, int ndx) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation) {
          return AnimationRoute(
            title: "Animation $ndx",
            description: desc,
          ); //Should take different things based on which screen it is
        },
        barrierColor: Colors.amber,
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
          var altAnimation = CurvedAnimation(
              parent: animation, curve: Curves.easeInOutCubicEmphasized);
          animation = CurvedAnimation(curve: Curves.easeOut, parent: animation);
          switch (ndx) {
            case 1:
              return RotationTransition(turns: animation, child: child);
            case 2:
              return SlideTransition(
                  position:
                      Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                          .animate(animation),
                  child: child);
            case 3:
              return ScaleTransition(scale: animation, child: child);
            case 4:
              return FadeTransition(opacity: animation, child: child);
            case 5:
              return RotationTransition(
                  turns: altAnimation,
                  alignment: Alignment.topLeft,
                  child: child);
            case 6:
              return SlideTransition(
                  position:
                      Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                          .animate(altAnimation),
                  child: child);
            case 7:
              return ScaleTransition(scale: altAnimation, child: child);
            case 8:
              return FadeTransition(opacity: altAnimation, child: child);
            default:
              return ScaleTransition(scale: animation, child: child);
          }
        },
      ),
    );
  }
}
