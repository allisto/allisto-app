import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

// https://www.linkedin.com/in/rishi-banerjee-39406915b/

class LinkedInPage extends StatelessWidget {
  String username, profileName;
  String linkedInUrl = "https://www.linkedin.com/in/";

  LinkedInPage({@required this.username, @required this.profileName}) {
    this.linkedInUrl = this.linkedInUrl + this.username + "/";
    print(this.linkedInUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.profileName}"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: this.linkedInUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Share Profile basically
          Share.share('Check out this person\'s LinkedIn Profile ${this.linkedInUrl}');
        },
        label: Text("Share"),
        icon: Icon(Icons.share),
        backgroundColor: Colors.black87,
        tooltip: "Share Profile",
      ),
    );
  }
}
