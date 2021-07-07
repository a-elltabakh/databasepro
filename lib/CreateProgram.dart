import 'package:database/AddCustomer.dart';
import 'package:database/Home.dart';
import 'package:database/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProgram extends StatefulWidget {
  CreateProgram({Key key}) : super(key: key);
  @override
  _CreateProgramState createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> {

  @override
  initState() {
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _companyController = new TextEditingController();
  final TextEditingController _programController = new TextEditingController();
  final TextEditingController _balanceController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Program",
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
            SizedBox(height:50),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _companyController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Company',

                ),
              ),
            ),
            SizedBox(height:15),new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _programController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Program Name',

                ),
              ),
            ),
            SizedBox(height:15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _balanceController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Max Balance',

                ),
              ),
            ),

            SizedBox(height:60),
            new Container(
              margin: EdgeInsets.only(left: 22, right: 22),
              height: 48,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddCustomer()),
                    ModalRoute.withName('/AddCustomer'),
                  );
                  //  }
                },
                child: Text(
                  "Create Program",
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
