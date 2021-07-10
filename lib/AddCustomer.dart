import 'dart:convert';
import 'package:database/Home.dart';
import 'package:database/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddCustomer extends StatefulWidget {
  AddCustomer({Key key}) : super(key: key);
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  initState() {
    super.initState();
    GetPrograms();
  }

  List programs;
  String _myProgram;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _firstController = new TextEditingController();
  final TextEditingController _lastController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _currentBalanceController = new TextEditingController();

  Future<String> GetPrograms() async {
    final response = await http.get(
      Uri.parse("https://insurance-sys.herokuapp.com/program/get-programs/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    var data = json.decode(response.body);
    setState(() {
      programs = data['allPrograms'];
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Customer",
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
                  value: _myProgram,
                  hint: Text(
                    "   Select Program",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                  ),
                  isExpanded: true,
                  onChanged: (String newVal) {
                    setState(() {
                      _myProgram = newVal;
                      print(_myProgram);
                    });
                  },
                  items: programs?.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(item['programName']),
                          value: item['ProgramID'].toString(),
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
                controller: _firstController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'First Name',
                  prefixIcon: new Icon(Icons.person_rounded,
                      color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height: 15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _lastController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Last Name',
                  prefixIcon: new Icon(Icons.person_rounded,
                      color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height: 15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _addressController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Address',
                  prefixIcon: new Icon(Icons.home_rounded,
                      color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height: 15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Phone Number',
                  prefixIcon: new Icon(Icons.phone_rounded,
                      color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height: 15),
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
                  prefixIcon: new Icon(Icons.mail_rounded,
                      color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height: 15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _currentBalanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Current Balance',
                  prefixIcon: new Icon(Icons.attach_money_rounded,
                      color: Colors.blueAccent.shade700),
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
                  if (_firstController.text.trim().isEmpty ||
                      _lastController.text.trim().isEmpty ||
                      _addressController.text.trim().isEmpty ||
                      _phoneController.text.trim().isEmpty ||
                      _emailController.text.trim().isEmpty ||
                      _currentBalanceController.text.trim().isEmpty ||
                      _myProgram.trim().isEmpty) {
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
                      databaseHelper.AddCustomer(
                          _firstController.text.trim(),
                          _lastController.text.trim(),
                          _addressController.text.trim(),
                          _emailController.text.trim(),
                          _phoneController.text.trim(),
                          _currentBalanceController.text.trim(),
                          _myProgram.trim());
                    });
                    Navigator.of(context).pop(new MaterialPageRoute(
                      builder: (BuildContext context) => new Home(),
                    ));
                  }
                },
                child: Text(
                  "Add",
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
