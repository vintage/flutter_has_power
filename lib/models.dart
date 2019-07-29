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
}

class Dish {
  final int id;
  final String name;
  final String image;

  Dish({
    @required this.id,
    @required this.name,
    @required this.image,
  });
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

List<Dish> getDishes() {
  return [];
}
