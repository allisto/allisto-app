import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GithubPage extends StatelessWidget {
  String username, profilename;
  String githubUrl = "https://github.com/";

  GithubPage({@required this.username, @required this.profilename}) {
    this.githubUrl = this.githubUrl + this.username + "/";
    print(this.githubUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.profilename}"),
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
          Share.share('Check out ${this.profilename}\'s GitHub Profile ${this
              .githubUrl}');
        },
        label: Text("Share"),
        icon: Icon(Icons.share),
        backgroundColor: Colors.black87,
        tooltip: "Share Profile",
      ),
    );
  }
}
