import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartIcon extends StatefulWidget {
  int items;
  CartIcon({this.items = 0});

  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.shopping_cart),
        ),
        Positioned(
          bottom: 30.0,
          child: Visibility(
            visible: widget.items == 0 ? false : true,
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.amber,
              child: Center(
                child: Text(
                  widget.items.toString(),
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
