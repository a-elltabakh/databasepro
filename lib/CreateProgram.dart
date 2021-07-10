import 'dart:convert';
import 'package:database/Home.dart';
import 'package:database/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateProgram extends StatefulWidget {
  CreateProgram({Key key}) : super(key: key);
  @override
  _CreateProgramState createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> {
  @override
  initState() {
    super.initState();
    GetCompanies();
  }

  List companies;
  String _myComp;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _programController = new TextEditingController();
  final TextEditingController _balanceController = new TextEditingController();

  Future<String> GetCompanies() async {
    final response = await http.get(
      Uri.parse("https://insurance-sys.herokuapp.com/company/get-companies/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    var data = json.decode(response.body);
    setState(() {
      companies = data['allCompanies'];
    });
    print(data);
  }

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
            SizedBox(height: 50),
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 22, right: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(67),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: DropdownButton<String>(
                  value: _myComp,
                  hint: Text(
                    "   Select Company",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                  ),
                  isExpanded: true,
                  onChanged: (String newVal) {
                    setState(() {
                      _myComp = newVal;
                      print(_myComp);
                    });
                  },
                  items: companies?.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(item['companyName']),
                          value: item['CompanyID'].toString(),
                        );
                      })?.toList() ??
                      [],
                ),
              ),
            ),
            SizedBox(height: 15),
            new Container(
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
            SizedBox(height: 15),
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
            SizedBox(height: 60),
            new Container(
              margin: EdgeInsets.only(left: 22, right: 22),
              height: 48,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  if (_programController.text.trim().isEmpty ||
                      _balanceController.text.trim().isEmpty ||
                      _myComp.trim().isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: new Text(
                              'Complete',
                              style:
                                  TextStyle(color: Colors.blueAccent.shade700),
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
                                    style:
                                        TextStyle(color: Colors.blue.shade700),
                                  ))
                            ],
                          );
                        });
                  } else {
                    setState(() {
                      databaseHelper.CreateProgram(
                          _programController.text.trim(),
                          _balanceController.text.trim(),
                          _myComp.trim());
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
