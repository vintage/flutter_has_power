import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'package:flutter_has_power/models.dart';

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
          var isFavorite = favorites.contains(restaurant);

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    restaurant.image,
                    height: 170,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    restaurant.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Colors.black,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.black38,
                    onPressed: () => toggleFavorite(restaurant),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
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
