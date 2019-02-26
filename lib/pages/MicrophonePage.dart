import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class MicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top : 80.0),
              child: Hero(
                tag: "heading",
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Recording",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: FloatingActionButton(
                elevation: 4.0,
                heroTag: "mic",
                onPressed: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.mic,
                  color: Colors.deepPurpleAccent,
                  size: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
