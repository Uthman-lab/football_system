import 'dart:math';

import "package:flutter/material.dart";
import 'package:football_system/providers/coach_provider.dart';
import 'package:football_system/providers/director_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/player_provider.dart';

class ViewTeam extends StatelessWidget {
  const ViewTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Team Details")),
      body: ListView(
        children: players(context)
          ..addAll(directors(context))
          ..addAll(coaches(context)),
      ),
    );
  }

  List<Widget> players(context) {
    var pros = Provider.of<PlayerProvider>(context).players;

    List<Map> players = pros
        .map((e) => {
              "name": e.name,
              "age": e.age,
              "nation": e.nation,
              "position": e.position,
              "contract": e.contract,
            })
        .toList();
    return pros.isEmpty
        ? []
        : List<Widget>.generate(pros.length, (index) {
            Map randPlayer = players[index];
            if (index == 0)
              return ListTile(
                title: Text("List of Players"),
              );
            return ListTile(
              title: Text(
                randPlayer["name"],
              ),
              trailing: Text(randPlayer["age"].toString()),
              subtitle: Row(
                children: [
                  Text(randPlayer["nation"]),
                  Text(randPlayer["contract"])
                ],
              ),
              leading: Text(randPlayer["position"]),
            );
          });
  }

  List<Widget> coaches(context) {
    var pros = Provider.of<CoachProvider>(context).coaches;
    List<Map> coaches = pros
        .map((e) => {
              "name": e.name,
              "age": e.age,
              "nation": e.nation,
              "position": e.position,
              "contract": e.contract,
            })
        .toList();
    return pros.isEmpty
        ? []
        : List<Widget>.generate(pros.length, (index) {
            Map randcoach = coaches[index];
            if (index == 0)
              return ListTile(
                title: Text("List of Coaches"),
              );
            return ListTile(
              title: Text(
                randcoach["name"],
              ),
              trailing: Text(randcoach["age"].toString()),
              subtitle: Row(
                children: [
                  Text(randcoach["nation"]),
                  Text(randcoach["contract"])
                ],
              ),
              leading: Text(randcoach["position"]),
            );
          });
  }

  List<Widget> directors(context) {
    var pros = Provider.of<DirectorsProvider>(context).directors;
    List<Map> directors = pros
        .map((e) => {
              "name": e.name,
              "position": e.position,
            })
        .toList();
    print(pros);
    return pros.isEmpty
        ? []
        : List<Widget>.generate(pros.length, (index) {
            Map randDirector = directors[index];
            if (index == 0)
              return ListTile(
                title: Text("List of Directors"),
              );
            return ListTile(
              title: Text(
                randDirector["name"],
              ),
              leading: Text(randDirector["position"]),
            );
          });
  }
}
