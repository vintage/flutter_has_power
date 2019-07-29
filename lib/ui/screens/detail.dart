import 'package:flutter/material.dart';

import '../shared/header.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Text("Detail screen"),
      ),
    );
  }
}
