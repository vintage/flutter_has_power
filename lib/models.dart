import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://my-json-server.typicode.com/vintage/flutter_has_power';

class Restaurant {
  final int id;
  final String name;
  final String image;

  Restaurant({
    @required this.id,
    @required this.name,
    @required this.image,
  });

  @override
  String toString() {
    return name;
  }
}

class Menu {
  final int id;
  final String name;
  final String image;
  final int price;

  Menu({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.price,
  });

  @override
  String toString() {
    return name;
  }
}

Future<List<Restaurant>> getRestaurants() async {
  var response = await http.get('$API_URL/restaurants/');
  var data = json.decode(response.body);

  return List<Restaurant>.from(data.map((data) {
    return Restaurant(
      id: data["id"],
      name: data["name"],
      image: data["image"],
    );
  }));
}

Future<List<Menu>> getMenu(Restaurant restaurant) async {
  var response = await http.get('$API_URL/menu/');
  var data = json.decode(response.body);

  return List<Menu>.from(data.map((data) {
    return Menu(
      id: data["id"] + (restaurant.id + 100) * 13,
      name: data["name"],
      image: data["image"],
      price: data["price"],
    );
  }));
}
