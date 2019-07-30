import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_has_power/models.dart';
import 'package:flutter_has_power/state.dart';
import 'package:flutter_has_power/ui/shared/menu_item.dart';
import 'package:flutter_has_power/ui/shared/header.dart';

class DetailScreenArguments {
  final Restaurant restaurant;

  DetailScreenArguments({this.restaurant});
}

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<List<Menu>> menuLoader;

  @override
  Widget build(BuildContext context) {
    final DetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    if (menuLoader == null) {
      menuLoader = getMenu(args.restaurant);
    }

    return Scaffold(
      appBar: Header(title: args.restaurant.name),
      body: FutureBuilder<List<Menu>>(
        future: menuLoader,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Text("Loading ..."),
            );
          }

          return ListView(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            children: snapshot.data.map((menu) {
              return MenuItem(menu: menu, onPressed: () => addToCart(menu));
            }).toList(),
          );
        },
      ),
    );
  }

  void addToCart(Menu menu) {
    Provider.of<CartState>(context, listen: false).addItem(menu);
  }
}
