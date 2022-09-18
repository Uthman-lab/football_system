import 'package:flutter/material.dart';
import 'package:football_system/providers/authentication.dart';
import 'package:football_system/views/dashboard.dart';
import 'package:football_system/views/sign_up.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(
            username: "Enter User Name",
            controller: email,
          ),
          MyTextField(
            username: "Enter password",
            controller: password,
          ),
          SizedBox(
            height: 50,
          ),
          MyElevatedButton(
            label: "Log In",
            onpress: () {
              var auth = Provider.of<Authentication>(context, listen: false);
              auth.authenticate(email.text, password.text, context);
              auth.userName = email.text.split("@")[0];
            },
          )
        ],
      ),
    );
  }
}
