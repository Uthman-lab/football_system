import 'package:flutter/material.dart';
import 'package:football_system/providers/news_provider.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatelessWidget {
  final News news;
  NewsDetails({Key? key, required this.news}) : super(key: key);
  var commentController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 10, 40),
              child: Text(
                news.headline,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            CircleAvatar(
              child: Container(width: 300),
              backgroundColor: news.Picture,
            ),
            Text(
              news.body + additionalInfo,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: news.comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(news.comments[index].message),
                        subtitle: Text(news.comments[index].commentor),
                      );
                    })),
            Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Add a comment",
                              style: Theme.of(context).textTheme.headline6,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          var pro =
                              Provider.of<NewsProvider>(context, listen: false);
                          var comment = Comment(
                              commentor: "Amin",
                              message: commentController.text);
                          pro.addComment(comment, news);
                          print(news.comments);
                        },
                        child: Icon(Icons.send),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
