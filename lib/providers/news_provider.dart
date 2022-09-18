import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  List<News> newsl = [];
  String _newsCollection = "news";

  void addNews(News news, context) {
    try {
      FirebaseFirestore.instance
          .collection(_newsCollection)
          .add({"headline": news.headline, "body": news.body});
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("success, waw")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void addComment(Comment comment, context, id) {
    try {
      FirebaseFirestore.instance
          .collection(_newsCollection)
          .doc(id)
          .collection("comments")
          .add({"commentor": comment.commentor, "message": comment.message});
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("success, waw")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Stream<List<Map>> getNews() async* {
    try {
      Stream<List<Map>> method = FirebaseFirestore.instance
          .collection(_newsCollection)
          .snapshots()
          .map((event) =>
              event.docs.map((e) => {"id": e.id, "data": e.data()}).toList());

      yield* method;
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Map>> getComments(id) async* {
    try {
      Stream<List<Map>> method = FirebaseFirestore.instance
          .collection(_newsCollection)
          .doc(id)
          .collection("comments")
          .snapshots()
          .map((event) => event.docs.map((e) => e.data()).toList());

      yield* method;
    } catch (e) {
      print(e);
    }
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
