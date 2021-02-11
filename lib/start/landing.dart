import 'package:estructura_practica_1/start/register.dart';
import 'package:estructura_practica_1/start/login.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: c5,
        body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    "assets/images/cupping.png",
                    height: 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: RaisedButton(
                    onPressed: _openReg,
                    child: Text("Registrate"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: RaisedButton(
                    onPressed: _openLogin,
                    child: Text("Ingresa"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openReg() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return RegisterPage();
    }));
  }

  void _openLogin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
