import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

AppBar Header(BuildContext context, {String title}) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(title == null ? "FOOdy" : title),
    actions: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => Navigator.of(context).pushNamed('/cart'),
        child: Padding(
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
      ),
    ],
  );
}
