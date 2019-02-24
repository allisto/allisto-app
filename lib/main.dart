import 'package:flutter/material.dart';
import 'package:allisto_app/pages/home_page.dart';

void main() => runApp(Allisto());

class Allisto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Allisto",
      home: HomePage(),
    );
  }
}
