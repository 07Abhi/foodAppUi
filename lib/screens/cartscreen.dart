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
        title: Text(
          'Cart(${currentUser.cart.length})',
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          if (index < currentUser.cart.length) {
            Order orders = currentUser.cart[index];
            return CartTiles(orders);
          }
          return Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ETA',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'X min',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Bill',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                    Text(
                      '₹ X',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey.shade800,
          );
        },
        itemCount: currentUser.cart.length + 1,
      ),
      bottomSheet: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
