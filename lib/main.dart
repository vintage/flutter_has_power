import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/screens/home.dart';
import 'ui/screens/detail.dart';
import 'ui/screens/cart.dart';
import 'state.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<CartState>.value(
      value: CartState(),
      child: App(),
    ),
  );
}

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
