import 'package:flutter/material.dart';
import 'package:football_system/views/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(username: "Enter User Name"),
          MyTextField(username: "Enter password"),
          MyTextField(username: "Verify Password"),
          SizedBox(
            height: 50,
          ),
          MyElevatedButton(
            label: "Create Account",
            onpress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginView()));
            },
          )
        ],
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  final label;
  final onpress;
  const MyElevatedButton({Key? key, required this.label, this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpress, child: Text(label));
  }
}

class MyTextField extends StatelessWidget {
  final username;
  final keyboad;
  final controller;
  const MyTextField(
      {Key? key, required this.username, this.controller, this.keyboad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          keyboardType: keyboad,
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              label: Text(username)),
        ));
  }
}
