import 'package:flutter/material.dart';
import 'package:football_system/views/sign_up.dart';

class UpdateFinance extends StatelessWidget {
  const UpdateFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Player")),
        body: ListView(
          children: [
            MyTextField(username: "year"),
            MyTextField(username: "Income"),
            MyTextField(username: "Expense"),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(label: "Update Income")
          ],
        ));
  }
}
