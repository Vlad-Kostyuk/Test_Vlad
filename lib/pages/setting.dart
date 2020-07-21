import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testvlad/container.dart';
import 'package:testvlad/pages/start_page.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  TextEditingController _controllerText;
  TextEditingController _controllerTextSize;
  bool visibilityText = false;
  bool visibilityTextSize = false;
  RegExp exp = new RegExp(r"\D");
  String textError = 'The field is Empty! Please print the text';
  String textSizeError = 'The field is Empty! Please print the number';
  bool text = false;
  bool textSize = false;

  void initState() {
    super.initState();
    _controllerText = TextEditingController();
    _controllerTextSize = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          kTitleAppBarSettingPage,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: bodySetting(),
    );
  }



  Widget bodySetting() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[

          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: TextField(
                        controller: _controllerText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Text',
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: visibilityText,
                    child: Text(
                      textError,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              )
          ),

          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _controllerTextSize,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Size Text',
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: visibilityTextSize,
                    child: Text(
                      textSizeError,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              )
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: RaisedButton(
                color: Colors.green[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text('Apply'),
                onPressed: () {
                  checkControllerTextIsEmpty();
                  checkControllerTextSizeIsEmpty();
                  if(text == true && textSize == true) {
                    Route route = MaterialPageRoute(builder: (context) => StartPage());
                    Navigator.push(context, route);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }



  ///Check ControllerText
  void checkControllerTextIsEmpty() {
    if (_controllerText.text.isEmpty) {
      setState(() {
        visibilityText = true;
        text = false;
      });
    } else {
      checkControllerTextLength();
    }
  }

  void checkControllerTextLength() {
    if (_controllerText.text.length <= 20) {
      setState(() {
        visibilityText = false;
        textStartPage = _controllerText.text;
        text = true;
      });
    } else {
      setState(() {
        textError = 'Max length this text is 10!';
        visibilityText = true;
        text = false;
      });
    }
  }

  ///Check ControllerTextSize
  void checkControllerTextSizeIsEmpty() {
    if (_controllerTextSize.text.isEmpty) {
      setState(() {
        visibilityTextSize = true;
        textSize = false;
      });
    } else {
      checkControllerTextSizeRegular();
    }
  }

  void checkControllerTextSizeRegular() {
    if (exp.hasMatch(_controllerTextSize.text).toString() == 'true') {
      setState(() {
        textSizeError = "Please don't use the symbol '-' or '.'";
        visibilityTextSize = true;
        textSize = false;
      });
    } else {
      checkControllerTextSize();
    }
  }

  void checkControllerTextSize() {
    if (9 >= double.parse(_controllerTextSize.text) ||
        double.parse(_controllerTextSize.text) > 100) {
      setState(() {
        visibilityTextSize = true;
        textSizeError = 'Min size text is 10, max size text is 100';
        textSize = false;
      });
    } else {
      setState(() {
        visibilityTextSize = false;
        sizeText = double.parse(_controllerTextSize.text);
        textSize = true;
      });
    }
  }
}
