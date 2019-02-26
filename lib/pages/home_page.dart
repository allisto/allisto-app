import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Allisto",
                style: TextStyle(color: Colors.grey, fontSize: 40.0,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: "mic",
        onPressed: () {
          Navigator.of(context).pushNamed("/mic");
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.mic_none,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.dashboard,
                color: Colors.deepPurpleAccent,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.perm_contact_calendar,
                color: Colors.deepPurpleAccent,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
