import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/start/login.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool accept = false;
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
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 20),
                  child: Text(
                    "Email:",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 20),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      accept = !accept;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          value: accept,
                          onChanged: null,
                        ),
                        Text(
                          "Acepto los terminos y condiciones",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: RaisedButton(
                    onPressed: _openHome,
                    child: Text("Registrate"),
                  ),
                ),
                Text(
                  "Ya tienes una cuenta?",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: _openLogin,
                  child: Text(
                    "INGRESA",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
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

  void _openLogin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
