import 'package:flutter_food_delivery_ui/widgets/cartstiles.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            Order orders = currentUser.cart[index];
            return CartTiles(orders);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1.0,
              color: Colors.grey.shade800,
            );
          },
          itemCount: currentUser.cart.length),
    );
  }
}
