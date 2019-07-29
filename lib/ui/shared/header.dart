import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

AppBar Header() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text("FOOdy"),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 16),
        child: Center(
          child: Badge(
            badgeColor: Colors.red,
            badgeContent: Text(
              "4",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            child: Icon(Icons.shopping_basket),
          ),
        ),
      ),
    ],
  );
}
