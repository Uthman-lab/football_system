import 'package:flutter/material.dart';
import 'package:football_system/providers/finance_provider.dart';
import 'package:football_system/views/sign_up.dart';
import 'package:provider/provider.dart';

class UpdateFinance extends StatelessWidget {
  UpdateFinance({Key? key}) : super(key: key);
  var fYear = TextEditingController();
  var fIncome = TextEditingController();
  var fExpenditure = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Player")),
        body: ListView(
          children: [
            MyTextField(
              username: "year",
              controller: fYear,
              keyboad: TextInputType.datetime,
            ),
            MyTextField(
              username: "Income",
              controller: fIncome,
              keyboad: TextInputType.number,
            ),
            MyTextField(
              username: "Expense",
              controller: fExpenditure,
              keyboad: TextInputType.number,
            ),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(
              label: "Update Income",
              onpress: () {
                var pro = Provider.of<FinanceProvider>(context, listen: false);
                var finance = Finance(
                    year: fYear.text,
                    expenditure: int.parse(fExpenditure.text),
                    income: int.parse(fIncome.text));
                pro.addFinance(finance, context);
                print(pro);
              },
            )
          ],
        ));
  }
}
