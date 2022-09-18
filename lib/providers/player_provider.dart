import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'news_provider.dart';

class PlayerProvider extends ChangeNotifier {
  List<Player> players = [];
  final String _playerCollection = "players";
  final String _name = "name";
  final String _age = "age";
  final String _nation = "nation";
  final String _position = "position";
  final String _contract = "contract";

  final String _team = "team";
  void addPlayer(Player player, context) async {
    try {
      await FirebaseFirestore.instance
          .collection(_team)
          .doc("9S9NAs66XMopQRpYvNtr")
          .collection(_playerCollection)
          .add({
        _name: player.name,
        _position: player.position,
        _age: player.age,
        _nation: player.nation,
        _contract: player.contract
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("success, waw")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Stream<List<Map>> getPlayers() async* {
    try {
      Stream<List<Map>> method = FirebaseFirestore.instance
          .collection(_team)
          .doc("9S9NAs66XMopQRpYvNtr")
          .collection(_playerCollection)
          .snapshots()
          .map((event) => event.docs.map((e) => e.data()).toList());
      yield* method;
    } catch (e) {
      print(e);
    }
  }
}

class Player {
  String name;
  int age;
  String nation;
  String position;
  String contract;
  Player(
      {required this.name,
      required this.age,
      required this.nation,
      required this.position,
      required this.contract});
}
