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
          Expanded(
            child: Row(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order.food.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.order.restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 135.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black54,
                            ),
                          ),
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 15.0,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onPressed: () {}),
                                Text(
                                  widget.order.quantity.toString(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 15.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            '₹ ' + '${widget.order.food.price * widget.order.quantity}',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
//₹
