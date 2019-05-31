import 'package:audio_recorder2/audio_recorder2.dart';
import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static const List<IconData> icons = const [
    EvaIcons.githubOutline,
    EvaIcons.peopleOutline,
    EvaIcons.micOutline
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: "heading",
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Allisto",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(icons.length, (int index) {
            Widget child = Container(
              alignment: FractionalOffset.topCenter,
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 1.0 - index / icons.length / 2.0,
                      curve: Curves.easeOut),
                ),
                child: FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  child: Icon(
                    icons[index],
                  ),
                  backgroundColor: Colors.deepPurpleAccent,
                  onPressed: () {
                    if(index==0) {
                      // Redirect to Gihub Repo/Organization
                    } else if(index == 1) {
                      // Redirect to Team Page
                      Navigator.of(context).pushNamed('/team_page');
                    } else {
                      // Recording through mic
                      setState(() {

                      });
                    }
                  },
                ),
              ),
            );
            return child;
          }).toList()
            ..add(
              FloatingActionButton(
                heroTag: null,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget child) {
                    return Transform(
                      transform:
                          Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                      alignment: FractionalOffset.center,
                      child: Icon(
                          _controller.isDismissed ? EvaIcons.activityOutline : EvaIcons.closeCircleOutline,),
                    );
                  },
                ),
                onPressed: () {
                  if (_controller.isDismissed) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                },
                backgroundColor: Colors.deepPurpleAccent,
              ),
            ),
        ),
      ),
//      FloatingActionButton(
//        heroTag: "mic",
//        onPressed: () async {
//          bool hasPermissions = await AudioRecorder2.hasPermissions;
//          if(hasPermissions) {
//            Navigator.of(context).pushNamed("/mic");
//          }
//          else {
//            bool audioPermission = await SimplePermissions.checkPermission(
//                Permission.RecordAudio);
//            bool storagePermission = await SimplePermissions.checkPermission(
//                Permission.WriteExternalStorage);
//            if (!audioPermission) {
//              await SimplePermissions.requestPermission(Permission.RecordAudio);
//            }
//            if (!storagePermission) {
//              await SimplePermissions.requestPermission(
//                  Permission.WriteExternalStorage);
//            }
//            hasPermissions = await AudioRecorder2.hasPermissions;
//            if (hasPermissions) {
//              Navigator.of(context).pushNamed("/mic");
//            }
//          }
//        },
//        backgroundColor: Colors.deepPurpleAccent,
//        child: Icon(Icons.mic_none,color: Colors.white,),
//      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.podcast,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () {
                  print("News List");
                  Navigator.of(context).pushNamed("/news_list");
                },
                tooltip: "Medical News",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  EvaIcons.messageCircleOutline,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () {
                  print("Assistant");
                  Navigator.of(context).pushNamed("/assistant");
                },
                tooltip: "AI Assistant",
              ),
            )
          ],
        ),
      ),
    );
  }
}
