import 'package:flutter/material.dart';
import 'package:football_system/views/view_screens/view_finance.dart';

import 'package:football_system/views/view_screens/view_news.dart';
import 'package:football_system/views/view_screens/view_team_details.dart';

import 'add_screens/add_coach.dart';
import 'add_screens/add_directors.dart';
import 'add_screens/add_finance.dart';
import 'add_screens/add_news.dart';
import 'add_screens/add_player.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Container(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: gridItems(context),
        ),
      ),
    );
  }

  List<Widget> gridItems(context) {
    List genre = [
      {"title": "View Team", "screen": ViewTeam()},
      {"title": "View News", "screen": NewsHeadLines()},
      {"title": "View Finance", "screen": VeiwFinance()},
      {"title": "Add Player", "screen": AddPlayer()},
      {"title": "Add News", "screen": AddNews()},
      {"title": "Update Finances", "screen": UpdateFinance()},
      {"title": "Add Coach", "screen": AddCoach()},
      {"title": "Add Management", "screen": AddDirector()}
    ];
    return List<Widget>.generate(
      genre.length,
      (index) => GestureDetector(
        child: Card(
          child: Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Text(
                genre[index]["title"],
                style: Theme.of(context).textTheme.bodyLarge,
              ))),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => genre[index]["screen"]));
        },
      ),
    );
  }
}
