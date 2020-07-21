import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testvlad/Widget/drawer.dart';
import 'package:testvlad/container.dart';

class StartPage extends StatefulWidget {

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Color _randomBackgroundColor;

  void randomNewColor() {
    setState(() {
      _randomBackgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  void initState() {
    super.initState();
    randomNewColor();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _randomBackgroundColor,
        drawer: DrawerMenu(),

        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            kTitleAppBarStartPage,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),

        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => randomNewColor(),
          child: Center(
            child: Text(
              textStartPage,
              style: TextStyle(
                color: Colors.white,
                fontSize: sizeText,
              ),
            ),
          ),
        ),

      ),
    );
  }
}
