import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

class GithubPage extends StatelessWidget {
  String username;
  String githubUrl = "https://github.com/";

  GithubPage({@required this.username}) {
    this.githubUrl = this.githubUrl + this.username + "/";
    print(this.githubUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.username}"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: this.githubUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Share Profile basically
          Share.share('Check out this person\'s GitHub Profile ${this.githubUrl}');
        },
        label: Text("Share"),
        icon: Icon(Icons.share),
        backgroundColor: Colors.black87,
        tooltip: "Share Profile",
      ),
    );
  }
}
