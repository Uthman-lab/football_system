import 'dart:math';

import 'package:flutter/material.dart';

class VeiwFinance extends StatelessWidget {
  const VeiwFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Financial records")),
      body: ListView(
        children: financialInfo(100),
      ),
    );
  }

  List<Widget> financialInfo(num) {
    List incomes = [30000000, 2300000, 23422342, 23421341, 134134, 543453554];
    List expenditures = [23242341, 13413, 32341243, 1343211, 13413411];
    return List<Widget>.generate(num, (index) {
      Map data = {
        "year": " 20${index < 10 ? "0$index" : index} ",
        "income": incomes[Random().nextInt(incomes.length)],
        "expenditure": expenditures[Random().nextInt(expenditures.length)]
      };

      int proLoss = data["income"] - data["expenditure"];
      return Card(
        child: ListTile(
          title: Text("Income: \$${data["income"]} "),
          leading: Text("year: ${data["year"]}"),
          subtitle: Text("Expenditure: \$${data['expenditure']}"),
          trailing: Text("${proLoss > 0 ? "profit" : "loss"}: \$$proLoss"),
        ),
      );
    });
  }
}
