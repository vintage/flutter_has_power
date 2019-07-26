import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'package:flutter_has_power/models.dart';
import '../shared/restaurant_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Restaurant> restaurants = [];
  List<Restaurant> favorites = [];

  @override
  void initState() {
    restaurants = getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("FOOdy"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Badge(
                badgeColor: Colors.red,
                badgeContent: Text(
                  "4",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Icon(Icons.shopping_basket),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        children: restaurants.map((restaurant) {
          return RestaurantItem(
            restaurant: restaurant,
            isFavorite: favorites.contains(restaurant),
            onPressed: (r) { toggleFavorite(r); },
          );
        }).toList(),
      ),
    );
  }

  void toggleFavorite(Restaurant restaurant) {
    setState(() {
      favorites.contains(restaurant)
          ? favorites.remove(restaurant)
          : favorites.add(restaurant);
    });
  }
}
