import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

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
  Response<List<dynamic>> response = await Dio().get('$API_URL/restaurants/');

  return response.data.map((data) {
    return Restaurant(
      id: data["id"],
      name: data["name"],
      image: data["image"],
    );
  }).toList();
}

Future<List<Menu>> getMenu(Restaurant restaurant) async {
  Response<List<dynamic>> response = await Dio().get('$API_URL/menu/');

  return response.data.map((data) {
    return Menu(
      id: data["id"] + (restaurant.id + 100) * 13,
      name: data["name"],
      image: data["image"],
      price: data["price"],
    );
  }).toList();
}
