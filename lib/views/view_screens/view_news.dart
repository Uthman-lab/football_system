import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_system/views/view_screens/new_details.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';

class NewsHeadLines extends StatelessWidget {
  const NewsHeadLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("News HeadLines")),
      body: StreamBuilder(
          stream: pro.getNews(),
          builder: (context, AsyncSnapshot<List<Map>> snapshot) {
            if (snapshot.hasError) {
              return Text("error, loading database...");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (!snapshot.hasData) return Text("no news yet");
            List<Map> req = snapshot.requireData;
            return ListView.builder(
                itemCount: req.length,
                itemBuilder: (context, index) {
                  String headline = req[index]["data"]["body"];
                  String body = req[index]["data"]["body"];
                  String newsId = req[index]["id"];

                  return GestureDetector(
                      child: ListTile(
                        title: Text(headline),
                        subtitle: Text(
                            " ${body.length > 20 ? "${body.substring(0, 20)}..." : body}"),
                      ),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NewsDetails(
                                news: News(headline: headline, body: body),
                                newsId: newsId,
                              ),
                            ),
                          ));
                });
          }),
    );
  }
}
