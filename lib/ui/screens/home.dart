import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

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

List<Restaurant> restaurants = [
  Restaurant(
    id: 1,
    name: "McDonald",
    image:
        "https://i.kinja-img.com/gawker-media/image/upload/s--C0XL-kme--/c_scale,f_auto,fl_progressive,q_80,w_800/i9aze4o8kcwrkyzeaj9d.jpg",
  ),
  Restaurant(
    id: 2,
    name: "Adong",
    image:
        "https://www.roughguides.com/wp-content/uploads/2015/04/bun-cha-vietnam-food-shutterstock_769738648-840x558.jpg",
  ),
  Restaurant(
    id: 3,
    name: "KFC",
    image:
        "https://www.kfc.com.au/sites/default/files/WEBSITE_CATERING_768x432px_V2.jpg",
  ),
  Restaurant(
    id: 4,
    name: "BBQ",
    image:
        "https://www.budgetdirect.com.au/blog/wp-content/uploads/2013/10/How-To-BBQ-Hero-951x512.jpg",
  ),
  Restaurant(
    id: 5,
    name: "Pancakes",
    image:
        "https://d3awvtnmmsvyot.cloudfront.net/api/file/6fTZjAw9Tjqf4XrddmRQ",
  ),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Restaurant> favorites = [];

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
