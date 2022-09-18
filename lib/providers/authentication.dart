//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/dashboard.dart';

class Authentication extends ChangeNotifier {
  String userName = "log in please";
  void authenticate(email, password, context) async {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: LinearProgressIndicator()));
      var method = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDashboard()));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("You are logged In")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
