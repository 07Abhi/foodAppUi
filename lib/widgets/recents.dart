import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class Recents extends StatelessWidget {
  _recenstListTiles(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 100.0,
              width: 100.0,
              image: AssetImage(order.food.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.food.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    order.date,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    order.restaurant.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 35.0,
                color: Colors.amber,
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recents',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 23.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Order order = currentUser.orders[index];
              return _recenstListTiles(context, order);
            },
            itemCount: currentUser.orders.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
