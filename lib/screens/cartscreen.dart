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
  final _scrollController = ScrollController();
  bool _showBottomsheet = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _showBottomsheet = true;
        });
      } else {
        setState(() {
          _showBottomsheet = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalBill = 0;
    currentUser.cart.forEach(
      (element) {
        totalBill += element.food.price * element.quantity;
      },
    );
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
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
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
                      '₹ ${totalBill.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
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
      bottomSheet: Visibility(
        visible: _showBottomsheet,
        child: Container(
          height: 70.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black54, offset: Offset(0, -1), blurRadius: 6.0),
          ], color: Theme.of(context).accentColor),
          child: Center(
            child: Text(
              'PLACE ORDER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
