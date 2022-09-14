import 'package:flutter/cupertino.dart';

class FinanceProvider extends ChangeNotifier {
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
