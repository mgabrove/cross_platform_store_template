import 'package:flutter/material.dart';

import 'package:cross_platform_store_template/screens/functionality/registration_input.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.red[50],
          appBar: AppBar(
            title: Text("cross_platform_store_template"),
            backgroundColor: Colors.red[400],
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