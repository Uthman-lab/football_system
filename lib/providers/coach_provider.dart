import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_system/views/add_screens/add_coach.dart';
import 'package:provider/provider.dart';

import 'news_provider.dart';

class CoachProvider extends ChangeNotifier {
  List<Coach> _coaches = [];
  set coaches(List<Coach> a) {
    _coaches = a;
  }

  List<Coach> get coaches => _coaches;
  final String _coachCollection = "coaches";
  final String _name = "name";
  final String _age = "age";
  final String _nation = "nation";
  final String _position = "position";
  final String _contract = "contract";

  final String _team = "team";
  void addCoach(Coach coach, context) async {
    try {
      await FirebaseFirestore.instance
          .collection(_team)
          .doc("9S9NAs66XMopQRpYvNtr")
          .collection(_coachCollection)
          .add({
        _name: coach.name,
        _position: coach.position,
        _age: coach.age,
        _nation: coach.nation,
        _contract: coach.contract
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("success, waw")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Stream<List<Map>> getCoaches() async* {
    try {
      Stream<List<Map>> method = FirebaseFirestore.instance
          .collection(_team)
          .doc("9S9NAs66XMopQRpYvNtr")
          .collection(_coachCollection)
          .snapshots()
          .map((event) => event.docs.map((e) => e.data()).toList());
      yield* method;
    } catch (e) {
      print(e);
    }
  }
}

class Coach {
  String name;
  int age;
  String nation;
  String position;
  String contract;
  Coach(
      {required this.name,
      required this.age,
      required this.nation,
      required this.position,
      required this.contract});
}
