import 'dart:convert';
import 'package:database/Home.dart';
import 'package:database/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddServices extends StatefulWidget {
  AddServices({Key key}) : super(key: key);
  @override
  _AddServicesState createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  @override
  initState() {
    super.initState();
    GetPrograms();
    GetServices();
  }

  List programs;
  String _myProgram;
  List Services;
  String _myServices;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _discountController = new TextEditingController();
  final TextEditingController _maxDiscountController = new TextEditingController();
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
  Future<String> GetServices() async {
    final response = await http.get(
      Uri.parse("https://insurance-sys.herokuapp.com/service/get-services/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    var data2 = json.decode(response.body);
    setState(() {
      Services = data2['allServices'];
    });
    print(data2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Services to program",
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
                  value: _myServices,
                  hint: Text(
                    "   Select Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                  ),
                  isExpanded: true,
                  onChanged: (String newVal) {
                    setState(() {
                      _myServices = newVal;
                      print(_myServices);
                    });
                  },
                  items: Services?.map((item) {
                    return new DropdownMenuItem(
                      child: new Text(item['serviceName']),
                      value: item['ServiceID'].toString(),
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
                controller: _discountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Discount',
                  prefixIcon: new Icon(Icons.attach_money_rounded,
                      color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            SizedBox(height: 15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _maxDiscountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Max Discount',
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
                  if (_discountController.text.trim().isEmpty ||
                      _maxDiscountController.text.trim().isEmpty ||
                      _myServices.trim().isEmpty ||
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
                      databaseHelper.AddService(
                          _myProgram.trim(),
                          _myServices.trim(),
                          _discountController.text.trim(),
                          _maxDiscountController.text.trim(),);
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
