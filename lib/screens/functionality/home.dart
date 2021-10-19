import 'package:flutter/material.dart';

import 'package:cross_platform_store_template/screens/functionality/registration_input.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color customRed = Color.fromRGBO(238, 51, 48, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("cross_platform_store_template"),
            backgroundColor: customRed,
            elevation: 0.0,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    child: Icon(
                      Icons.favorite,
                    ),
                  )
              ),
            ],
          ),
          body: Registration_input(),
    );
  }
}