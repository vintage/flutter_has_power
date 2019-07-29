import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'package:flutter_has_power/state.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  Header({Key key, this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
                badgeContent: Consumer<CartState>(
                  builder: (context, value, _) => Text(
                    value.count.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                child: Icon(Icons.shopping_basket),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
