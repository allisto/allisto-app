import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:allisto_app/news_conf.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:allisto_app/pages/full_article_page.dart';
import 'dart:io';

class MedicalNews extends StatefulWidget {
  String author;
  String title;
  String description;
  String url;

  MedicalNews({this.author, this.title, this.description, this.url});

  factory MedicalNews.fromJson(Map<String, dynamic> json) {
    return MedicalNews(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );
  }

  @override
  _MedicalNewsState createState() => _MedicalNewsState();
}

class _MedicalNewsState extends State<MedicalNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InfaNews"),
      ),
      body: NewsList(),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<MedicalNews> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
              backgroundColor: Colors.lightBlue,
            ),
            title: Text(news[index].title),
            onTap: () {
              var url = news[index].url;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => FullArticle(url),
                  ));
            },
          ),
        );
      },
    );
  }
}
