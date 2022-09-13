import 'package:flutter/material.dart';
import 'package:football_system/views/sign_up.dart';

class AddDirector extends StatelessWidget {
  const AddDirector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Director")),
        body: ListView(
          children: [
            MyTextField(username: "Directors's Name"),
            MyTextField(username: "Position"),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(label: "Add Director")
          ],
        ));
  }
}
