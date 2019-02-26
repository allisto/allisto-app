import 'package:flutter/material.dart';
import 'package:allisto_app/pages/home_page.dart';
import 'pages/microphone_page.dart';

void main() => runApp(Allisto());

class Allisto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomePage(),
        '/mic': (context) => MicrophonePage(),
      },
      debugShowCheckedModeBanner: false,
      title: "Allisto",
      home: HomePage(),
    );
  }
}
