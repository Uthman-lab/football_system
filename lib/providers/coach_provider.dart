import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CoachProvider extends ChangeNotifier {
  List<Coach> _coaches = [];
  set coaches(List<Coach> a) {
    _coaches = a;
  }

  List<Coach> get coaches => _coaches;
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
