import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_system/providers/finance_provider.dart';
import 'package:provider/provider.dart';

class VeiwFinance extends StatelessWidget {
  const VeiwFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<FinanceProvider>(context).getFinance();
    return Scaffold(
      appBar: AppBar(title: Text("Financial records")),
      body: StreamBuilder(
          stream: pro,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) return Center();
            if (snapshot.hasData) {
              List<Map> data = snapshot.requireData;
              print(data);
              return ListView(
                children: financialInfo(data, context),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  List<Widget> financialInfo(List<Map> finances, context) {
    return List<Widget>.generate(finances.length, (index) {
      Map data = finances[index];
      // int profit = 3;
      // data["income"] - data["expenditure"];

      return Card(
        child: ListTile(
          title: Text("Income: ${data["income"]} "),
          leading: Text("year: "),

          ///${data["year"]}"),
          subtitle: Text("Expenditure: \$${data['expenditure']}"),
          //  trailing: Text("${profit > 0 ? "profit" : "loss"}: \$$profit"),
        ),
      );
    });
  }
}
