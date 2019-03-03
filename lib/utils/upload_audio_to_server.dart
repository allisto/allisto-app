import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

void readAudioFile(String filePath, String apiUrl) async {
  var config = File(filePath);

  var audioFile = await config.readAsBytes();
  File _audioFile = new File(filePath); // TODO
  Dio dio = Dio();
  FormData formData = FormData(); // just like JS
  formData.add("audio", UploadFileInfo(_audioFile, basename(filePath)));
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
