import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DirectorsProvider extends ChangeNotifier {
  List<Director> directors = [];
}

class Director {
  String name;

  String position;

  Director({
    required this.name,
    required this.position,
  });
}
