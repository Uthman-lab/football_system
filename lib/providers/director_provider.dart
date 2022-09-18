import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'news_provider.dart';

class DirectorsProvider extends ChangeNotifier {
  String _team = "team";
  String _directors = "directors";
  String _name = "name";
  String _position = "position";

  List<Director> directors = [];
  void addDirector(Director director, context) {
    try {
      FirebaseFirestore.instance
          .collection(_team)
          .doc("9S9NAs66XMopQRpYvNtr")
          .collection("directors")
          .add({_name: director.name, _position: director.position});
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("success, waw")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Stream<List<Map>> getDirectors() async* {
    try {
      Stream<List<Map>> method = FirebaseFirestore.instance
          .collection(_team)
          .doc("9S9NAs66XMopQRpYvNtr")
          .collection(_directors)
          .snapshots()
          .map((event) => event.docs.map((e) => e.data()).toList());
      yield* method;
    } catch (e) {
      print(e);
    }
  }
}

class Director {
  String name;

  String position;

  Director({
    required this.name,
    required this.position,
  });
}
