import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_system/providers/finance_provider.dart';
import 'package:provider/provider.dart';

class VeiwFinance extends StatelessWidget {
  const VeiwFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Financial records")),
      body: ListView(
        children: financialInfo(context),
      ),
    );
  }

  List<Widget> financialInfo(context) {
    var pro = Provider.of<FinanceProvider>(context).finances;
    List<Map> finances = pro
        .map((e) => {
              "year": e.year,
              "income": e.income,
              "expenditure": e.expenditure,
              "profit": e.calculateProfit()
            })
        .toList();

    return List<Widget>.generate(finances.length, (index) {
      Map data = finances[index];
      print(data);
      return Card(
        child: ListTile(
          title: Text("Income: \$${data["income"]} "),
          leading: Text("year: ${data["year"]}"),
          subtitle: Text("Expenditure: \$${data['expenditure']}"),
          trailing: Text(
              "${data["profit"] > 0 ? "profit" : "loss"}: \$${data["profit"]}"),
        ),
      );
    });
  }
}
