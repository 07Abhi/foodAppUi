import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';

class MenuStackTiles extends StatefulWidget {
  final Food foodObject;
  MenuStackTiles(this.foodObject);

  @override
  _MenuStackTilesState createState() => _MenuStackTilesState();
}

class _MenuStackTilesState extends State<MenuStackTiles> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image(
            height: 180.0,
            width: 180.0,
            fit: BoxFit.cover,
            image: AssetImage(widget.foodObject.imageUrl),
          ),
        ),
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: <Color>[
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.3,
                0.5,
                0.7,
                0.9,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 90.0,
          child: Column(
            children: [
              Text(
                widget.foodObject.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "₹" + widget.foodObject.price.toString(),
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 10.0,
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 22.0,
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
