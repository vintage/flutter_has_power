import 'package:flutter/material.dart';

import 'package:flutter_has_power/models.dart';
import 'package:flutter_has_power/ui/screens/detail.dart';
import 'package:flutter_has_power/ui/shared/restaurant_item.dart';
import 'package:flutter_has_power/ui/shared/header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Restaurant>> restaurantsLoader;
  List<Restaurant> favorites = [];

  @override
  void initState() {
    restaurantsLoader = getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: FutureBuilder<List<Restaurant>>(
          future: restaurantsLoader,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: Text("Loading ..."),
              );
            }

            return ListView(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              children: snapshot.data.map((restaurant) {
                return RestaurantItem(
                  restaurant: restaurant,
                  isFavorite: favorites.contains(restaurant),
                  onPressed: () => navigateDetail(restaurant),
                  onFavorite: () {
                    toggleFavorite(restaurant);
                  },
                );
              }).toList(),
            );
          }),
    );
  }

  void navigateDetail(Restaurant restaurant) {
    Navigator.of(context).pushNamed(
      "/details",
      arguments: DetailScreenArguments(restaurant: restaurant),
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
