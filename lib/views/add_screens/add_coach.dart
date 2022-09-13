import 'package:flutter/material.dart';
import 'package:football_system/views/sign_up.dart';

class AddCoach extends StatelessWidget {
  const AddCoach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Coach")),
        body: ListView(
          children: [
            MyTextField(username: "Coach's Name"),
            MyTextField(username: "Coach's Age"),
            MyTextField(username: "Coach's Nationality"),
            MyTextField(username: "Contract"),
            // MyTextField(username: "Position"),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(label: "Add Coach")
          ],
        ));
  }
}
