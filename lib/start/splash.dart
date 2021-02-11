import 'package:estructura_practica_1/start/landing.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return LandingPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                "https://previews.123rf.com/images/vandycandy/vandycandy1501/vandycandy150100067/35546889-coffee-grains.jpg",
              ),
            ),
          ),
          child: Image.asset(
            "assets/images/cupping.png",
            height: 100,
          ),
        ),
      ),
    );
  }
}
