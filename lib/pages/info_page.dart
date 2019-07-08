import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("A django app that takes input a audio file and returns predicted values",style: TextStyle(color: Colors.black54),textAlign: TextAlign.center,),
        )),
      ),
    );
  }
}
