import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/start/register.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c5,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: Image.asset(
                  "assets/images/cupping.png",
                  height: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  "Nombre Completo:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  "Password:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: RaisedButton(
                  onPressed: _openHome,
                  child: Text("Entrar"),
                ),
              ),
              Text(
                "Aun no tienes una cuenta?",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: _openRegister,
                child: Text(
                  "REGISTRATE",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return Home(
        title: APP_TITLE,
      );
    }));
  }

  void _openRegister() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return RegisterPage();
    }));
  }
}
