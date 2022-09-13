import 'package:flutter/material.dart';
import 'package:football_system/views/sign_up.dart';

class AddNews extends StatelessWidget {
  const AddNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Player")),
        body: ListView(
          children: [
            MyTextField(username: "HeadLine"),
            // we need to add an image here
            MyTextField(username: "News body"),

            SizedBox(
              height: 50,
            ),
            MyElevatedButton(label: "Add Player")
          ],
        ));
  }
}
