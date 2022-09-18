import 'package:flutter/material.dart';
import 'package:football_system/providers/authentication.dart';
import 'package:football_system/providers/news_provider.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatefulWidget {
  final News news;
  final String newsId;
  NewsDetails({Key? key, required this.news, required this.newsId})
      : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
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
    var pro = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("detailed news")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 10, 40),
              child: Text(
                widget.news.headline,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            CircleAvatar(
              child: Container(width: 300),
              backgroundColor: widget.news.Picture,
            ),
            Text(
              widget.news.body + additionalInfo,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Container(
                child: StreamBuilder(
                    stream: pro.getComments(widget.newsId),
                    builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                      if (snapshot.hasError) {
                        return Text("error, loading database...");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData) return Text("no comments yet");

                      var req = snapshot.requireData;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: req.length,
                          itemBuilder: (context, index) {
                            String commentor = req[index]["commentor"];
                            String message = req[index]["message"];
                            return ListTile(
                              title: Text(commentor),
                              subtitle: Text(message),
                            );
                          });
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
                          var auth = Provider.of<Authentication>(context,
                              listen: false);
                          var comment = Comment(
                              commentor: auth.userName,
                              message: commentController.text);

                          pro.addComment(comment, context, widget.newsId);
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
