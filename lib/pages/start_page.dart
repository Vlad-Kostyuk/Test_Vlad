import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testvlad/container.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Color randomColor;

  void random() {
    setState(() {
      randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    random();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: randomColor,

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            kTitleAppBarStartPage,
            style: TextStyle(
              color: Colors.black
            ),
          ),
          centerTitle: true,
        ),

        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => random(),
          child: Center(
            child: Text('Hey there'),
          ),
        ),

      ),
    );
  }
}
