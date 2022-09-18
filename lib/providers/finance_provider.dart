import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_provider.dart';

class FinanceProvider extends ChangeNotifier {
  String year = "year";
  String income = "income";
  String finance = "finance";
  String expenditure = "expenditure";
  String profit = "profit";
  void addFinance(Finance finance, context) {
    try {
      FirebaseFirestore.instance.collection("finance").add({
        year: finance.year,
        income: finance.income,
        expenditure: finance.expenditure
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added Success")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Stream<List<Map>> getFinance() async* {
    Stream<List<Map>> data = await FirebaseFirestore.instance
        .collection(finance)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());

    yield* data;
  }

  List<Finance> finances = [];
}

class Finance {
  final year;
  final int income;
  final int expenditure;
  Finance(
      {required this.year, required this.expenditure, required this.income});

  int calculateProfit() {
    return income - expenditure;
  }
}
