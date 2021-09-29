import 'package:flutter/material.dart';

class Registration_input extends StatefulWidget {
  @override
  _Registration_input createState() => _Registration_input();
}

class _Registration_input extends State<Registration_input> {

  String inputString = "";
  String registrationString = "";

  void onPressed() {
    setState(() => registrationString = inputString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 100.0),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your registration',
                      ),
                      onChanged: (String value) async{
                        inputString = value;
                      },
                    ),
                    OutlinedButton(
                        onPressed: onPressed,
                      child: const Text("Submit"),
                    ),
                    Center(
                      child: Text(
                          '$registrationString',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      )
    );
  }
}