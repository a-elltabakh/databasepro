import 'package:database/Home.dart';
import 'package:database/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  initState() {
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new ListView(
          children: [
            SizedBox(height:13),
            new Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: 10.5,
              ),
              child: Text(
                "Medical Insurance System",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueAccent.shade700,
                    fontSize: 30.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 100)),
            new Container(
              alignment: Alignment.center,
              child: new Image.asset(
                'img/Capture.jpg',
                height: 150.0,
                width: 500.0,
              ),
            ),
            SizedBox(height:50),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Email',
                  prefixIcon:
                      new Icon(Icons.mail_rounded, color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height:15),
            new Container(
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Password',
                  prefixIcon: new Icon(Icons.vpn_key_rounded,
                      color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height:30),
            new Container(
              margin: EdgeInsets.only(left: 22, right: 22),
              height: 48,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  if (_emailController.text.trim().isEmpty ||
                      _passwordController.text.trim().isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: new Text(
                              'Complete',
                              style: TextStyle(color: Colors.blueAccent.shade700),
                            ),
                            content:
                                Text("Please input your email and password"),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: new Text(
                                    'Ok',
                                    style: TextStyle(color: Colors.blue.shade700),
                                  ))
                            ],
                          );
                        });
                  }
                  else {
                    setState(() {
                      databaseHelper.loginData(
                          _emailController.text.trim().toLowerCase(),
                          _passwordController.text.trim());
                    });

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()),
                      ModalRoute.withName('/Home'),
                    );
                 }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.blueAccent.shade700,
                textColor: Colors.white,
              ),
            ),
          ],
        ));
  }
}
