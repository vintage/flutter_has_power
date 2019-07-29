import 'package:flutter/material.dart';

import 'ui/screens/home.dart';
import 'ui/screens/detail.dart';
import 'ui/screens/cart.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter has Power',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/details': (context) => DetailScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
