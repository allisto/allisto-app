import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FullArticle extends StatelessWidget {
  static String tag = 'description-page';
  FullArticle(this.urlNews);
  final String urlNews;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Full Article",
          style: new TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: new SafeArea(
        child: new Column(
          children: <Widget>[
            MaterialApp(
              routes: {
                "/": (_) => new WebviewScaffold(
                  url: urlNews,
                  appBar: new AppBar(title: new Text("")),
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
