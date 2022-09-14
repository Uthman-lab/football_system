import 'package:flutter/material.dart';
import 'package:football_system/providers/coach_provider.dart';
import 'package:football_system/views/sign_up.dart';
import 'package:provider/provider.dart';

class AddCoach extends StatelessWidget {
  AddCoach({Key? key}) : super(key: key);
  var cName = TextEditingController();
  var cAge = TextEditingController();
  var cPostion = TextEditingController();
  var cNation = TextEditingController();
  var cContract = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Coach")),
        body: ListView(
          children: [
            MyTextField(
              username: "Coach's Name",
              controller: cName,
            ),
            MyTextField(
              username: "Coach's Age",
              keyboad: TextInputType.number,
              controller: cAge,
            ),
            MyTextField(
              username: "Coach's Nationality",
              controller: cNation,
            ),
            MyTextField(
              username: "Contract",
              controller: cContract,
            ),
            // MyTextField(username: "Position"),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(
              label: "Add Coach",
              onpress: () {
                var pro =
                    Provider.of<CoachProvider>(context, listen: false).coaches;
                Coach coach = Coach(
                    name: cName.text,
                    age: int.parse(cAge.text),
                    nation: cNation.text,
                    position: cPostion.text,
                    contract: cContract.text);
                pro.add(coach);
              },
            )
          ],
        ));
  }
}
