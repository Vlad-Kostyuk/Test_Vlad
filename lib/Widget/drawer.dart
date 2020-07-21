import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testvlad/pages/setting.dart';

class DrawerMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          DrawerHeader(
            child: Icon(
              Icons.supervised_user_circle,
              size: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.settings
            ),
            title: Text('Setting'),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => SecondRoute()));
            }
          ),

        ],
      ),
    );
  }
}





