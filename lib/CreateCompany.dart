import 'package:database/Home.dart';
import 'package:database/databasehelper.dart';
import 'package:flutter/material.dart';

class CreateCompany extends StatefulWidget {
  CreateCompany({Key key}) : super(key: key);
  @override
  _CreateCompanyState createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {

  @override
  initState() {
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
        "Create Company",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blueAccent.shade700,
    ),
        backgroundColor: Colors.white,
        body: new ListView(
          children: [
            SizedBox(height:13),

            SizedBox(height:50),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Name',
                  prefixIcon:
                  new Icon(Icons.person_rounded , color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height:15),new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _addressController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Address',
                  prefixIcon:
                  new Icon(Icons.home_rounded , color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height:15),
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
                  if (_nameController.text.trim().isEmpty ||
                      _emailController.text.trim().isEmpty ||
                      _addressController.text.trim().isEmpty||
                      _passwordController.text.trim().isEmpty ) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: new Text(
                              'Complete',
                              style: TextStyle(color: Colors.blueAccent.shade700),
                            ),
                            content:
                                Text("Please input the required information"),
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
                  } else {
                    setState(() {
                      databaseHelper.CreateCompany(
                          _nameController.text.trim(),
                          _passwordController.text.trim(),
                          _emailController.text.trim(),
                          _addressController.text.trim());
                    });
                    Navigator.of(context).pop(new MaterialPageRoute(
                      builder: (BuildContext context) => new Home(),
                    ));
                   }
                },
                child: Text(
                  "Create ",
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
