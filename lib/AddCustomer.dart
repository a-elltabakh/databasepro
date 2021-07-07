import 'package:database/Home.dart';
import 'package:database/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCustomer extends StatefulWidget {
  AddCustomer({Key key}) : super(key: key);
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {

  @override
  initState() {
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _programController = new TextEditingController();
  final TextEditingController _firstController = new TextEditingController();
  final TextEditingController _lastController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

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
            SizedBox(height:50),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _programController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'program',

                ),
              ),
            ),
            SizedBox(height:15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _firstController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'First Name',
                  prefixIcon:
                  new Icon(Icons.person_rounded , color: Colors.blueAccent.shade700),

                ),
              ),
            ),
            SizedBox(height:15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _lastController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Last Name',
                  prefixIcon:
                  new Icon(Icons.person_rounded , color: Colors.blueAccent.shade700),

                ),
              ),
            ),
            SizedBox(height:15),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 22, right: 22),
              child: new TextField(
                controller: _addressController,
                keyboardType: TextInputType.emailAddress,
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
                controller: _phoneController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(67)),
                  labelText: 'Phone Number',
                  prefixIcon:
                  new Icon(Icons.phone_rounded , color: Colors.blueAccent.shade700),

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
                        builder: (BuildContext context) => Home()),
                    ModalRoute.withName('/Home'),
                  );
                  //  }
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
