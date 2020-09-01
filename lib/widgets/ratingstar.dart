import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rating;
  final double starSize;
  const RatingStar({this.rating, this.starSize});

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int k = 0; k < rating; k++) {
      stars += '⭐';
    }
    return Text(
      stars,
      style: TextStyle(letterSpacing: 1.5, fontSize: starSize),
    );
  }
}
