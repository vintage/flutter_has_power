import 'package:flutter/material.dart';

import 'package:flutter_has_power/models.dart';

class RestaurantItem extends StatelessWidget {
  final bool isFavorite;
  final Restaurant restaurant;
  final Function onPressed;

  RestaurantItem({
    this.isFavorite,
    this.restaurant,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
            bottom: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Colors.black.withOpacity(0.7),
                child: Text(
                  restaurant.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black38,
              onPressed: () => onPressed(restaurant),
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
  }
}
