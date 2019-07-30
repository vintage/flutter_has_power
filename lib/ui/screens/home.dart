import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_has_power/models.dart';
import 'package:flutter_has_power/ui/screens/detail.dart';
import 'package:flutter_has_power/ui/shared/restaurant_item.dart';
import 'package:flutter_has_power/ui/shared/header.dart';

const String favoritesKey = "favorite_restaurants";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Restaurant>> restaurantsLoader;
  List<int> favorites = [];

  @override
  void initState() {
    restaurantsLoader = getRestaurants();
    initFavorites();
    super.initState();
  }

  void initFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cachedFavorites = prefs.getStringList(favoritesKey);
    if (cachedFavorites != null) {
      favorites = cachedFavorites.map((favorite) => int.parse(favorite)).toList();
    }
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
                isFavorite: favorites.contains(restaurant.id),
                onPressed: () => navigateDetail(restaurant),
                onFavorite: () {
                  toggleFavorite(restaurant);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void navigateDetail(Restaurant restaurant) {
    Navigator.of(context).pushNamed(
      "/details",
      arguments: DetailScreenArguments(restaurant: restaurant),
    );
  }

  void toggleFavorite(Restaurant restaurant) async {
    favorites.contains(restaurant.id)
        ? favorites.remove(restaurant.id)
        : favorites.add(restaurant.id);

    setState(() {});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(favoritesKey, favorites.map((restaurant) => restaurant.toString()).toList());
  }
}
