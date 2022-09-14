import 'package:flutter/material.dart';
import 'package:football_system/providers/director_provider.dart';
import 'package:football_system/views/sign_up.dart';
import 'package:provider/provider.dart';

class AddDirector extends StatelessWidget {
  AddDirector({Key? key}) : super(key: key);
  var dName = TextEditingController();
  var dPosition = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Director")),
        body: ListView(
          children: [
            MyTextField(
              username: "Directors's Name",
              controller: dName,
            ),
            MyTextField(
              username: "Position",
              controller: dPosition,
            ),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(
              label: "Add Director",
              onpress: () {
                var pro = Provider.of<DirectorsProvider>(context, listen: false)
                    .directors;
                Director director =
                    Director(name: dName.text, position: dPosition.text);
                pro.add(director);
                print(pro);
              },
            )
          ],
        ));
  }
}
