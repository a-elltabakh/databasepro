import 'package:database/AddCustomer.dart';
import 'package:database/AddServices.dart';
import 'package:database/CreateCompany.dart';
import 'package:database/CreateProgram.dart';
import 'package:database/Home.dart';
import 'package:flutter/material.dart';
import 'package:database/LoginPage.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/Home': (BuildContext context) => new Home(),
        '/CreateCompany': (BuildContext context) => new CreateCompany(),
        '/CreateProgram': (BuildContext context) => new CreateProgram(),
        '/AddCustomer': (BuildContext context) => new AddCustomer(),
        '/AddServices': (BuildContext context) => new AddServices(),

      },
      home: new LoginPage(),
    );
  }
}
