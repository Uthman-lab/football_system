import 'package:flutter/material.dart';
import 'package:football_system/providers/player_provider.dart';
import 'package:football_system/views/sign_up.dart';
import 'package:provider/provider.dart';

class AddPlayer extends StatelessWidget {
  AddPlayer({Key? key}) : super(key: key);
  TextEditingController pName = TextEditingController();
  TextEditingController pAge = TextEditingController();
  TextEditingController pContract = TextEditingController();
  TextEditingController pNation = TextEditingController();
  TextEditingController pPostion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Player")),
        body: ListView(
          children: [
            MyTextField(
              username: "Player's Name",
              controller: pName,
            ),
            MyTextField(
              keyboad: TextInputType.number,
              username: "Player's Age",
              controller: pAge,
            ),
            MyTextField(
              username: "Player's Nationality",
              controller: pNation,
            ),
            MyTextField(
              username: "Contract",
              controller: pContract,
            ),
            MyTextField(
              username: "Position",
              controller: pPostion,
            ),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(
              label: "Add Player",
              onpress: () {
                var pro =
                    Provider.of<PlayerProvider>(context, listen: false).players;
                pro.add(Player(
                    name: pName.text,
                    age: int.parse(pAge.text),
                    nation: pNation.text,
                    position: pPostion.text,
                    contract: pContract.text));
              },
            )
          ],
        ));
  }
}
