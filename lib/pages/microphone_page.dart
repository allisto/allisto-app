import 'package:flutter/material.dart';
import 'package:audio_recorder2/audio_recorder2.dart';
import 'package:path_provider/path_provider.dart';

class Microphone extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MicrophonePage();
  }

}

class MicrophonePage extends State<Microphone> {
  bool isRecording;
  @override
  void initState() {
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
                onPressed: () async {
                  Recording recording = await AudioRecorder2.stop();
                  print("Path : ${recording.path},  Format : ${recording.audioOutputFormat},  Duration : ${recording.duration},  Extension : ${recording.extension},");
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
  Future record() async {
    isRecording = await AudioRecorder2.isRecording;
    if(!isRecording) {
      final path = (await getExternalStorageDirectory()).path;
      await AudioRecorder2.start(
          path: "$path/Recording", audioOutputFormat: AudioOutputFormat.AAC);
      print("Recording started");
    }
  }
}
