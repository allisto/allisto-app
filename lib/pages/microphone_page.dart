import 'dart:io';

import 'package:allisto_app/utils/upload_audio_to_server.dart';
import 'package:audio_recorder2/audio_recorder2.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Microphone extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MicrophonePage();
  }

}

class MicrophonePage extends State<Microphone> {
  bool isRecording;
  String recordingMessage;
  @override
  void initState() {
    recordingMessage = "Getting Ready";
    record();
    super.initState();
  }
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
                  child: Text(recordingMessage,
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
                onPressed: () async {
                  print('Stop called');
                  setState(() {
                    recordingMessage = "Finishing up";
                  });
                  AudioRecorder2.stop().then((recording) {
                    if (recording != null) {
                      setState(() {
                        recordingMessage = "Uploading to server...";
                      });
                      print("Path : ${recording.path},  Format : ${recording
                          .audioOutputFormat},  Duration : ${recording
                          .duration},  Extension : ${recording.extension},");
                      readAudioFile(recording.path, "API URL HERE");
                      Navigator.of(context).pop();
                    }
                    else {
                      print("Recording is null");
                      setState(() {
                        recordingMessage =
                        "Something is wrong. Try restarting the app";
                      });
                    }
                  });
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
  Future record() async {
    isRecording = await AudioRecorder2.isRecording;
    if(!isRecording) {
      final path = (await getApplicationDocumentsDirectory()).path;
      File file = new File("$path/Recording.m4a");
      if (file != null && await file.exists())
        await file.delete();
      AudioRecorder2.start(
          path: "$path/Recording", audioOutputFormat: AudioOutputFormat.AAC)
          .whenComplete(() {
        setState(() {
          recordingMessage = "Recording";
        });
        print("Recording started");
      });
    }
    else {
      print("Already recording");
      setState(() {
        recordingMessage = "Something is wrong. Try restarting the app";
      });
    }
  }
}
