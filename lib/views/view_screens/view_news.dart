import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_system/views/view_screens/new_details.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';

class NewsHeadLines extends StatelessWidget {
  const NewsHeadLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News HeadLines")),
      body: ListView(
        children: newsHeadLines(context),
      ),
    );
  }

  List<Widget> newsHeadLines(context) {
    var pros = Provider.of<NewsProvider>(context, listen: false).news;
    List<Map> news = pros
        .map((e) =>
            {"info": e.body, "HeadLine": e.headline, "picture": e.Picture})
        .toList();

    return List<Widget>.generate(news.length, (index) {
      String subTitle = news[index]["info"];
      Color color = news[index]["picture"];

      String headline = news[index]["HeadLine"];
      return GestureDetector(
          child: ListTile(
              title: Text(headline),
              subtitle: Text(subTitle),
              leading: CircleAvatar(
                backgroundColor: color,
              )),
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => NewsDetails(news: pros[index])),
              ));
    });
  }
}
