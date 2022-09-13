import 'package:flutter/material.dart';
import 'package:football_system/views/sign_up.dart';

class AddPlayer extends StatelessWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Player")),
        body: ListView(
          children: [
            MyTextField(username: "Player's Name"),
            MyTextField(username: "Player's Age"),
            MyTextField(username: "Player's Nationality"),
            MyTextField(username: "Contract"),
            MyTextField(username: "Position"),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(label: "Add Player")
          ],
        ));
  }
}
