import 'package:flutter/material.dart';
import 'package:football_system/views/dashboard.dart';
import 'package:football_system/views/sign_up.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(username: "Enter User Name"),
          MyTextField(username: "Enter password"),
          SizedBox(
            height: 50,
          ),
          MyElevatedButton(
            label: "Log In",
            onpress: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyDashboard()));
            },
          )
        ],
      ),
    );
  }
}
