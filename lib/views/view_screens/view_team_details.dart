import 'dart:async';
import 'dart:math';

import "package:flutter/material.dart";
import 'package:football_system/providers/coach_provider.dart';
import 'package:football_system/providers/director_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/player_provider.dart';
import 'package:async/async.dart' show StreamGroup;

class ViewTeam extends StatelessWidget {
  const ViewTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pros1 = Provider.of<DirectorsProvider>(context);
    var pros2 = Provider.of<PlayerProvider>(context);
    var pros3 = Provider.of<CoachProvider>(context);

    return Scaffold(
        appBar: AppBar(title: Text("View Team Details")),
        body: ListView(
          children: [
            Text("Players"),
            StreamBuilder(
                stream: pros2.getPlayers(),
                builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                  if (snapshot.hasError) {
                    return Text("error, loading database...");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) return Text("no players yet");

                  List<Map> a = snapshot.requireData;

                  return Column(
                    children: List<Widget>.generate(
                        a.length,
                        (index) => ListTile(
                              title: Text(a[index]["name"]),
                              subtitle: Column(children: [
                                Text("contract: ${a[index]["contract"]}"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Age: ${a[index]["age"]}")
                              ]),
                              trailing:
                                  Text("nationality: ${a[index]["nation"]}"),
                              leading: Text("position ${a[index]["position"]}"),
                            )),
                  );
                }),
            Text("Coaches"),
            StreamBuilder(
                stream: pros3.getCoaches(),
                builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                  if (snapshot.hasError) {
                    return Text("error, loading database...");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) return Text("no coaches yet");

                  List<Map> a = snapshot.requireData;
                  print(a);
                  return Column(
                    children: List<Widget>.generate(
                        a.length,
                        (index) => ListTile(
                              title: Text(a[index]["name"]),
                              subtitle: Column(children: [
                                Text("contract: ${a[index]["contract"]}"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Age: ${a[index]["age"]}")
                              ]),
                              trailing:
                                  Text("nationality: ${a[index]["nation"]}"),
                              leading: Text("position ${a[index]["position"]}"),
                            )),
                  );
                }),
            Text("Directors"),
            StreamBuilder(
                stream: pros1.getDirectors(),
                builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                  if (snapshot.hasError) {
                    return Text("error, loading database...");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) return Text("no directors yet");

                  List<Map> a = snapshot.requireData;

                  return Column(
                    children: List<Widget>.generate(
                        a.length,
                        (index) => ListTile(
                              title: Text(a[index]["name"]),
                              subtitle: Text(a[index]["position"]),
                            )),
                  );
                }),
          ],
        ));
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
}
