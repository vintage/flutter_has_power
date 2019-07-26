import 'package:flutter/widgets.dart';

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

List<Restaurant> _restaurants = [
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

List<Restaurant> getRestaurants() {
  return _restaurants;
}

List<Dish> getDishes() {
  return [];
}
