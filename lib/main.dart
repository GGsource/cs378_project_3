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
        primarySwatch: Colors.amber,
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
            titledTile(
              title: "Sonic Spins Freakin Fast",
              desc:
                  "In this implicit animation Sonic The Hedgehog spins 144000 degrees in just 15 seconds. This of course is just a mere fraction of what he is truly capable of.",
              ndx: 1,
            ),
            titledTile(
              title: "The Suspicious Sniffer",
              desc:
                  "This implicit animation presents a dog that is trying to make up its mind about you. Tap its nose repeatedly to be sniffed.",
              ndx: 2,
            ),
            titledTile(
              title: "Ton Drop",
              desc:
                  "This implicit animation shows a ton dropping from a height, simulating gravity as it speeds up before hitting the ground and bouncing slightly.",
              ndx: 3,
            ),
            titledTile(
              title: "Shy Chameleon",
              desc:
                  "This implicit animation shows a chameleon who's a bit shy. Click him to watch him disappear. Click again to reappear, or interrupt mid-fade",
              ndx: 4,
            ),
            titledTile(
              title: "Big Balloon",
              desc:
                  "This implicit animation presents a balloon waiting to be filled. Tap the balloon to make it bigger!",
              ndx: 5,
            ),
            titledTile(
              title: " World's Slowest Heart Pump.",
              desc:
                  "This animation takes a heart and gradually grows it in size. The user can pause this at any time, and once the heartbeat is complete, the user can contract the heart. Pausing and resuming functions correctly in both directions!",
              ndx: 6,
            ),
            titledTile(
              title: "Title 7",
              desc: "Explicit description goes here...",
              ndx: 7,
            ),
            titledTile(
              title: "Title 8",
              desc: "Explicit description goes here...",
              ndx: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget titledTile(
      {required String title, required String desc, required int ndx}) {
    String sceneTitle = ndx >= 6 ? "Explicit" : "Implicit";
    sceneTitle = "Animation $ndx: $sceneTitle";
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.workspaces),
          title: Text(
            sceneTitle,
            style: const TextStyle(fontSize: 35),
          ),
          onTap: () => screenTransition(sceneTitle, title, desc, ndx),
        ),
        const Divider(
          endIndent: 40,
          indent: 40,
          color: Colors.black12,
          thickness: 3,
        )
      ],
    );
  }

  Future<dynamic> screenTransition(
      String sceneTitle, String animationTitle, String desc, int ndx) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, anim, anim2) {
          return AnimationRoute(
            screenTitle: sceneTitle,
            animationTitle: animationTitle,
            description: desc,
            index: ndx,
          ); //Should take different things based on which screen it is
        },
        barrierColor: Colors.amber,
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, anim, anim2, child) {
          var altAnimation = CurvedAnimation(
              parent: anim, curve: Curves.easeInOutCubicEmphasized);
          anim = CurvedAnimation(curve: Curves.decelerate, parent: anim);
          switch (ndx) {
            case 1:
              return RotationTransition(turns: anim, child: child);
            case 2:
              return SlideTransition(
                  position: Tween(
                          begin: const Offset(0.0, 1.0),
                          end: const Offset(0.0, 0.0))
                      .animate(anim),
                  child: child);
            case 3:
              return ScaleTransition(scale: anim, child: child);
            case 4:
              return FadeTransition(opacity: anim, child: child);
            case 5:
              return RotationTransition(
                  turns: altAnimation,
                  alignment: Alignment.topLeft,
                  child: child);
            case 6:
              return SlideTransition(
                  position: Tween(
                          begin: const Offset(0.0, 1.0),
                          end: const Offset(0.0, 0.0))
                      .animate(altAnimation),
                  child: child);
            case 7:
              return ScaleTransition(scale: altAnimation, child: child);
            case 8:
              return FadeTransition(opacity: altAnimation, child: child);
            default:
              return ScaleTransition(scale: anim, child: child);
          }
        },
      ),
    );
  }
}
