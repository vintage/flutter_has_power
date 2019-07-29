import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_has_power/state.dart';
import 'package:flutter_has_power/ui/shared/menu_image.dart';

class CartScreen extends StatelessWidget {
  Widget buildItems(BuildContext context) {
    var items = Provider.of<CartState>(context).items;

    return GridView.count(
      padding: EdgeInsets.all(8),
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      crossAxisCount: 3,
      children: items.keys.map((menu) {
        var count = items[menu];

        return Stack(
          fit: StackFit.expand,
          children: [
            MenuImage(menu: menu),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                color: Colors.red.withOpacity(0.7),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '${count * menu.price}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' PLN', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: buildItems(context),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: null,
                    child: Text("Checkout"),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: FloatingActionButton(
                mini: true,
                heroTag: null,
                backgroundColor: Colors.red,
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}
