import 'package:flutter/material.dart';
import 'package:allisto_app/pages/home_page.dart';
import 'pages/microphone_page.dart';
import 'package:allisto_app/pages/medical_assistant.dart';
import 'package:allisto_app/pages/news_list_page.dart';
import 'package:allisto_app/pages/news_detail_page.dart';
import 'package:allisto_app/pages/intro_screen.dart';

void main() => runApp(Allisto());

class Allisto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomePage(),
        '/mic': (context) => Microphone(),
        '/assistant': (context) => Assistant(),
        '/news_list': (context) => NewsList(),
        '/news_detail' : (BuildContext context) => NewsDetailPage(),
        '/intro_screen': (BuildContext context) => IntroScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: "Allisto",
      home: IntroScreen(),
    );
  }
}
