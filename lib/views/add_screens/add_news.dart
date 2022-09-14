import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_system/providers/news_provider.dart';
import 'package:football_system/views/sign_up.dart';
import 'package:provider/provider.dart';

class AddNews extends StatelessWidget {
  AddNews({Key? key}) : super(key: key);

  var headline = TextEditingController();
  var body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Player")),
        body: ListView(
          children: [
            MyTextField(
              username: "HeadLine",
              controller: headline,
            ),
            // we need to add an image here
            MyTextField(
              username: "News body",
              controller: body,
            ),

            SizedBox(
              height: 50,
            ),
            MyElevatedButton(
              label: "Add Player",
              onpress: () {
                var pros =
                    Provider.of<NewsProvider>(context, listen: false).news;
                List colors = [
                  Colors.red,
                  Colors.purple,
                  Colors.blueAccent,
                  Colors.greenAccent
                ];
                var news = News(
                    headline: headline.text,
                    body: body.text,
                    Picture: colors[Random().nextInt(colors.length)]);
                pros.add(news);
                print(news);
              },
            )
          ],
        ));
  }
}
