import 'package:flutter/material.dart';

import 'package:flutter_has_power/models.dart';
import 'package:flutter_has_power/ui/shared/header.dart';

class DetailScreenArguments {
  final Restaurant restaurant;

  DetailScreenArguments({this.restaurant});
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: Header(title: args.restaurant.name),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
