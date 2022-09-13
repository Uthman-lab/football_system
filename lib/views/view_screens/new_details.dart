import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final headLine;
  final String subhead;
  final color;
  NewsDetails(
      {Key? key,
      required this.headLine,
      required this.subhead,
      required this.color})
      : super(key: key);
  String additionalInfo =
      "In academic terms, a text is anything that conveys a set of "
      "meanings to the person who examines it. "
      "You might have thought that texts were limited to written"
      "In academic terms, a text is anything that conveys a set of "
      "meanings to the person who examines it. "
      "You might have thought that texts were limited to written"
      "In academic terms, a text is anything that conveys a set of "
      "meanings to the person who examines it. "
      "You might have thought that texts were limited to written";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("detailed news")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 10, 40),
            child: Text(
              headLine,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          CircleAvatar(
            child: Container(width: 300),
            backgroundColor: color,
          ),
          Text(
            subhead + additionalInfo,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
