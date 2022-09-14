import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PlayerProvider extends ChangeNotifier {
  List<Player> players = [];
  late String _name;
  late int _age;
  late String _nation;
  late String _position;
  late String _contract;

  set name(String newName) {
    _name = newName;
  }

  set age(int newAge) {
    _age = newAge;
  }

  set position(String newPos) {
    _position = newPos;
  }

  set nation(String newNation) {
    _nation = newNation;
  }

  set contract(String newContract) {
    _contract = newContract;
  }

  String get name => _name;
  String get position => _position;
  int get age => _age;
  String get nation => _nation;
  String get contract => _contract;
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
