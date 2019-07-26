import 'package:flutter/material.dart';

import 'ui/screens/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter has Power',
      home: HomeScreen(),
    );
  }
}