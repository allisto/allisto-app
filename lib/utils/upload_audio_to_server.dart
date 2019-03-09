import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

void readAudioFile(String filePath, String apiUrl) async {
  var config = File(filePath);

  var audioFile = await config.readAsBytes();
  File _audioFile = new File(filePath);
  print(audioFile.toString());
  print(_audioFile);
  Dio dio = Dio();
  FormData formData = new FormData.from(
      <String, dynamic>{
        "audio_file": UploadFileInfo(_audioFile, basename(filePath))
      });
  print("Form data : " + formData.keys.toString());
  dio.options.baseUrl = apiUrl;
  dio.post("/audio/",
        data: formData,
        options: Options(
            method: 'POST',
            connectTimeout: 10000,
            contentType: ContentType.parse("application/json"),
            receiveDataWhenStatusError: true,
            receiveTimeout: 10000,
            responseType: ResponseType.json // or ResponseType.JSON
            ),
    onSendProgress: (received, total) {
      if (total != -1) {
        print((received / total * 100).toStringAsFixed(0) + "%");
      }
    },)
      .then((response) => print("Response: " + response.toString()))
      .catchError((error) => print("Error : " + error.toString()));
}
