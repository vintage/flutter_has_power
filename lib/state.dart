import 'package:flutter/material.dart';

import './models.dart';

class CartState extends ChangeNotifier {
  Map<Menu, int> _items = {};

  Map<Menu, int> get items => _items;
  void addItem(Menu item) {
    _items.putIfAbsent(item, () => 0);
    _items[item] += 1;
    notifyListeners();
  }

  int get count => _items.values.fold(0, (a, b) => a + b);
}
