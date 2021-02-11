import 'package:estructura_practica_1/start/landing.dart';
import 'package:estructura_practica_1/start/splash.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
          primaryColor: c3,
          accentColor: c5,
          textTheme: TextTheme(
              // bodyText1: TextStyle(
              //   fontFamily: "AksidenzGrotesk",
              // ),
              ),
          appBarTheme: AppBarTheme(
            color: c5,
          )),
      home: SplashScreenPage(),
    );
  }
}
