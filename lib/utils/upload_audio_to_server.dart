import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

void readAudioFile(String filePath, String apiUrl) async {
  var config = File(filePath);

  var audioFile = await config.readAsBytes();
  File _audioFile = new File(filePath); // TODO
  print(audioFile.toString());
  Dio dio = Dio();
  FormData formData = new FormData.from(<String, dynamic>{"audio": UploadFileInfo(_audioFile, basename(filePath))});
  dio
      .post(
        apiUrl,
        data: formData,
        options: Options(
            method: 'POST',
            responseType: ResponseType.json // or ResponseType.JSON
            ),
      )
      .then((response) => print(response))
      .catchError((error) => print(error));
}
