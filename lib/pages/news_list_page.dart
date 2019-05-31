import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:allisto_app/pages/news_detail_page.dart';
import 'dart:async';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() {
    return _NewsListState();
  }
}

class _NewsListState extends State<NewsList> {
  var newsData;
  bool _isLoading = true;
  String url =
      "https://newsapi.org/v2/top-headlines?sources=medical-news-today&apiKey=cb66441c818542498140327c2c01e151";

  @override
  void initState() {
    super.initState();
    getNews().then((c) {
      setState(() {
        _isLoading = false;
      });
      newsData = jsonDecode(c);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allisto Headlines"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              // Refresh News
            },
            icon: Icon(EvaIcons.sync),
            tooltip: "Refresh",
          ),

        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return newsHeadlineTile(
                    newsData['articles'][index]['title'],
                    newsData['articles'][index]['description'],
                    newsData['articles'][index]['content'],
                    newsData['articles'][index]['urlToImage'],
                  );
                },
              ),
            ),
    );
  }

  Widget newsHeadlineTile(
      String title, String subtitle, String content, String urlToImage) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(
                      title: title,
                      description: subtitle,
                      content: content,
                      urlToImage: urlToImage,
                    ),
                maintainState: true,
              ),
            );
          },
          leading: Hero(
            tag: urlToImage,
            child: Image.network(
              urlToImage,
              fit: BoxFit.fitWidth,
              height: 96.0,
              width: 96.0,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
      ],
    );
  }

  Future<String> getNews() async {
    final response = await http.get('$url');
    print(response.statusCode.toString());
    return response.body;
  }
}
