import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text("Cart screen"),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: FloatingActionButton(
                mini: true,
                heroTag: null,
                backgroundColor: Colors.red,
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}
