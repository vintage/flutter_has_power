import 'package:flutter/material.dart';

import 'package:flutter_has_power/models.dart';
import 'package:flutter_has_power/ui/shared/menu_image.dart';

class MenuItem extends StatelessWidget {
  final Menu menu;
  final Function onPressed;

  MenuItem({
    this.menu,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: MenuImage(menu: menu, size: 80),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${menu.price.toString()} coins",
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: onPressed,
            color: Colors.red,
            textColor: Colors.white,
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
