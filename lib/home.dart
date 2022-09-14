import 'package:flutter/material.dart';
import 'package:football_system/providers/coach_provider.dart';
import 'package:football_system/providers/director_provider.dart';
import 'package:football_system/providers/finance_provider.dart';
import 'package:football_system/providers/news_provider.dart';
import 'package:football_system/providers/player_provider.dart';
import 'package:football_system/views/sign_up.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> providers(context) => <ChangeNotifierProvider>[
      ChangeNotifierProvider<PlayerProvider>(
          create: (context) => PlayerProvider()),
      ChangeNotifierProvider<DirectorsProvider>(
          create: (context) => DirectorsProvider()),
      ChangeNotifierProvider<CoachProvider>(
          create: (context) => CoachProvider()),
      ChangeNotifierProvider<NewsProvider>(create: (context) => NewsProvider()),
      ChangeNotifierProvider<FinanceProvider>(
          create: (context) => FinanceProvider())
    ];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(context),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUp();
  }
}
