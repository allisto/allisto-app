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
          title: Text("Expected Features", style: TextStyle(color: Colors.deepPurpleAccent)),
          centerTitle: true,
        ),
        body: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Return of predicted value from django server",style: TextStyle(color: Colors.black54),textAlign: TextAlign.center,),
        )),
      ),
    );
  }
}
