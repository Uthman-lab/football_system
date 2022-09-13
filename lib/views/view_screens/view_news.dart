import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_system/views/view_screens/new_details.dart';

class NewsHeadLines extends StatelessWidget {
  const NewsHeadLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News HeadLines")),
      body: ListView(
        children: newsHeadLines(30, context),
      ),
    );
  }

  Map getInfoAndColor() {
    Random rand = Random();

    List colors = [
      Colors.red,
      Colors.purple,
      Colors.blueAccent,
      Colors.greenAccent
    ];

    List info = [
      "ConG Into Existing Systems. Quick Account Setup. WebEST-based API",
      " Reliable & Scalable. Global Reach and Delivery. Services: Simplified R",
      "Business Profile Support.",
      "-Based Interface. Easy To Implement. Simple & .",
      "lobally. Access 1000+ Networks For Your SMS Campaigns. Easy Integration",
    ];

    return {
      "color": colors[rand.nextInt(colors.length)],
      "info": info[rand.nextInt(info.length)]
    };
  }

  List<Widget> newsHeadLines(num, context) {
    return List<Widget>.generate(num, (index) {
      String subTitle = getInfoAndColor()["info"];
      Color color = getInfoAndColor()["color"];
      return GestureDetector(
          child: ListTile(
              title: Text("HeadLine $index"),
              subtitle: Text(subTitle),
              leading: CircleAvatar(
                backgroundColor: color,
              )),
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => NewsDetails(
                        headLine: "headLine $index",
                        subhead: subTitle,
                        color: color)),
              ));
    });
  }
}
