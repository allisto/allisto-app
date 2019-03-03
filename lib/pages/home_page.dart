import 'package:audio_recorder2/audio_recorder2.dart';
import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';

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
              child: Hero(
                tag: "heading",
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Allisto",
                    style: TextStyle(color: Colors.grey, fontSize: 40.0,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: "mic",
        onPressed: () async {
          bool hasPermissions = await AudioRecorder2.hasPermissions;
          if(hasPermissions) {
            Navigator.of(context).pushNamed("/mic");
          }
          else {
            bool audioPermission = await SimplePermissions.checkPermission(
                Permission.RecordAudio);
            bool storagePermission = await SimplePermissions.checkPermission(
                Permission.WriteExternalStorage);
            if (!audioPermission) {
              await SimplePermissions.requestPermission(Permission.RecordAudio);
            }
            if (!storagePermission) {
              await SimplePermissions.requestPermission(
                  Permission.WriteExternalStorage);
            }
          }
          hasPermissions = await AudioRecorder2.hasPermissions;
          if(hasPermissions) {
            Navigator.of(context).pushNamed("/mic");
          }
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
