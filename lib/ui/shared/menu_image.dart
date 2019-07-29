import 'package:flutter/cupertino.dart';

import 'package:flutter_has_power/models.dart';

class MenuImage extends StatelessWidget {
  MenuImage({
    this.menu,
    this.size,
  });

  final Menu menu;
  final double size;

  @override
  Widget build(BuildContext context) {
    return menu.image == null
        ? Image.asset(
            'assets/menu_empty.jpg',
            height: size,
            width: size,
            fit: BoxFit.cover,
          )
        : Image.network(
            menu.image,
            height: size,
            width: size,
            fit: BoxFit.cover,
          );
  }
}
