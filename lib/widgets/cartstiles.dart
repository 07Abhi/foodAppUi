import 'package:flutter_food_delivery_ui/models/order.dart';
import 'package:flutter/material.dart';

class CartTiles extends StatefulWidget {
  final Order order;
  CartTiles(this.order);

  @override
  _CartTilesState createState() => _CartTilesState();
}

class _CartTilesState extends State<CartTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 150.0,
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage(widget.order.food.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
