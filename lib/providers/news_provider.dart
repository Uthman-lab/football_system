import 'package:flutter/cupertino.dart';

class NewsProvider extends ChangeNotifier {
  List<News> news = [];
  void addComment(Comment comment, News news) {
    news.comments.add(comment);
    notifyListeners();
  }
}

class News {
  final String headline;
  final String body;
  final Picture;
  News({required this.headline, required this.body, this.Picture});
  final List<Comment> comments = [];
}

class Comment {
  final commentor;
  final message;
  Comment({this.commentor, this.message});
}
