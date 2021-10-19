import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Registration_input extends StatefulWidget {
  @override
  _Registration_input createState() => _Registration_input();
}

class _Registration_input extends State<Registration_input> {

  Color customRed = Color.fromRGBO(238, 51, 48, 1);
  Color customLightGrey = Color.fromRGBO(211, 213, 223, 1);

  EdgeInsets customPaddingToggleButton = EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0);
  EdgeInsets customPaddingTitle = EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 5.0);
  EdgeInsets customPaddingSmallTitle = EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0);
  EdgeInsets customPaddingSubmit = EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0);

  final textController = TextEditingController();

  bool _visible = false;

  var selection = ['Nije odabran', 'A', 'B', 'C'];
  String dropdownvalue = 'Nije odabran';

  String inputString = "";
  String registrationString = "";

  List<bool> isSelected = [false, false];
  List<bool> isSelectedS = [false];
  List<bool> isSelectedN = [false];

  void changeState() {
    setState(() {
      registrationString = inputString;
      isSelected[0] = isSelectedS[0];
      isSelected[1] = isSelectedN[0];
    });
  }

  void resetState() {
    setState(() {
      _visible = true;
      Future.delayed(Duration(seconds: 5), () {
        if (mounted)
          setState(() {
            _visible = false;
          });
      });
      dropdownvalue = selection[0];
      inputString = "";
      registrationString = "";
      isSelected = [false, false];
      isSelectedS = [false];
      isSelectedN = [false];
    });
  }

  void onPressed() {
    changeState();
    showAlertDialog(context);
  }

  void onSubmit() {
    textController.clear();
    resetState();
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text(
          'Spremi',
        style: TextStyle(color: customRed),
      ),
      onPressed: () {
        Navigator.pop(context);
        onSubmit();
      },
    );

    Widget changeButton = TextButton(
      child: Text(
        'Promjeni',
        style: TextStyle(color: customRed),
      ),
      onPressed: () { Navigator.pop(context); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Slobodan prolaz"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text((() {
            if(registrationString!="") {
              return "Registracija: $registrationString";
            }
            return "Registracija: Nije unesena";
          }()),
            style: TextStyle(color: customRed),
          ),
          Text(
              'Tip vozila: $dropdownvalue',
              style: TextStyle(color: customRed),
          ),
          Text((() {
              if(isSelected[0]) {
                return "Jug dopušten";
              }
              return "Jug nije dopušten";
            }()),
              style: TextStyle(color: customRed),
          ),
          Text((() {
              if(isSelected[1]) {
                return "Sjever dopušten";
              }
              return "Sjever nije dopušten";
            }()),
              style: TextStyle(color: customRed),
          ),
        ],
      ),
      actions: [
        changeButton, okButton
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(236, 244, 248, 1),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Text(
                      'Slobodan prolaz',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: customPaddingTitle,
                      child: Text(
                                'Registarska oznaka',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                    ),
                    Container(
                      color: Colors.white,
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: Colors.grey, width: 0.0,),
                            borderRadius: BorderRadius.all(Radius.circular(0.0))
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                          hintText: '',
                        ),
                        onChanged: (String value) async{
                          inputString = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: customPaddingSmallTitle,
                      child: Text(
                        'Tip slobodnog prolaza',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                      DecoratedBox(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0, style: BorderStyle.solid, color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(0.0)),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                isExpanded: true,
                                value: dropdownvalue,
                                items: selection.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            )
                          )
                      ),
                    Padding(
                      padding: customPaddingSmallTitle,
                      child: Text(
                        'Ulazna kamera',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    /*ToggleButtons(
                      borderColor: Colors.blue,
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          'Jug',
                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Sjever',
                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ],
                      onPressed: (int index) {
                        int count = 0;
                        isSelected.forEach((bool val) {
                          if (val) count++;
                        });

                        if (isSelected[index] && count < 2)
                          return;

                        setState(() {
                          isSelected[index] = !isSelected[index];
                        });
                      },
                      isSelected: isSelected,
                    ),*/
                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: customLightGrey,
                        border: Border.all(color: Colors.blueGrey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: ToggleButtons(
                        fillColor: Colors.grey,
                        renderBorder: false,
                        borderColor: Colors.blue,
                        direction: Axis.vertical,
                        children: <Widget>[
                          Text(
                            'Jug',
                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
                          ),
                        ],
                        onPressed: (int index) {
                          setState(() {
                            isSelectedS[0] = !isSelectedS[0];
                          });
                        },
                        isSelected: isSelectedS,
                      ),
                    ),
                    Padding(
                      padding: customPaddingToggleButton,
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: customLightGrey,
                          border: Border.all(color: Colors.blueGrey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        ),
                        child: ToggleButtons(
                          fillColor: Colors.grey,
                          renderBorder: false,
                          borderColor: Colors.blue,
                          direction: Axis.vertical,
                          children: <Widget>[
                            Text(
                              'Sjever',
                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              isSelectedN[0] = !isSelectedN[0];
                            });
                          },
                          isSelected: isSelectedN,
                        ),
                      ),
                    ),
                    Padding(
                      padding: customPaddingSubmit,
                      child: OutlinedButton(
                        onPressed: onPressed,
                        child: Text("Slobodan prolaz"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(15.0),
                          primary: Colors.white,
                          backgroundColor: customRed,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Center(
                            child: Text(
                              'Spremljeno',
                              style: TextStyle(color: customRed),
                            ),
                        )
                    )
                  ],
                ),
              )
          )
        ],
      )
    );
  }
}