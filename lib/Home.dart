import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueAccent.shade700,
        ),
        body: new ListView(
          children: [
            SizedBox(height:80),
            new Container(
                margin: EdgeInsets.only(left: 22, right: 22),
                alignment: Alignment.center,
                child: new Text(
                  "Welcome at home page. you have finished",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )),
            SizedBox(height:10),
        //
        //     new Container(
        //         margin: EdgeInsets.only(left: 22, right: 22),
        //         alignment: Alignment.center,
        //         child: new Text(
        //               "just click on the button",
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //               color: Colors.blueAccent,
        //               fontSize: 40.0,
        //               fontFamily: 'Raleway',
        //               fontWeight: FontWeight.bold,
        //               fontStyle: FontStyle.italic),
        //         )),
        //
        //     SizedBox(height:40),
        // new Container(
        //   margin: EdgeInsets.only(left: 22, right: 22),
        //   height: 48,
        //   child:  new RaisedButton(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(30)),
        //       onPressed: () {
        //         Navigator.of(context).pushNamed('/Create');
        //
        //       },
        //       child: Text(
        //         "Create",
        //         style: TextStyle(
        //           fontSize: 24,
        //           fontFamily: 'Raleway',
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       color: Colors.blueAccent.shade700,
        //       textColor: Colors.white,
        //     ),)
          ],
        )
    );
  }
}
