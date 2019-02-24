import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/autism_allisto_github.jpg"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Allisto", style: TextStyle(color: Colors.purple, fontSize: 32.0),),
            )
          ],
        ),
      ),
    );
  }
}
