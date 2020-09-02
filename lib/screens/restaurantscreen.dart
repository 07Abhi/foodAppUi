import 'package:toast/toast.dart';
import 'package:flutter_food_delivery_ui/widgets/menustacks.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/widgets/ratingstar.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool _isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 33.0,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isFav = !_isFav;
                        });
                        if (_isFav) {
                          Toast.show(
                            'Added to Favorites',
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM,
                            backgroundColor:
                                Theme.of(context).accentColor.withOpacity(0.8),
                            textColor: Colors.white,
                          );
                        }
                      },
                      icon: Icon(
                        _isFav ? Icons.favorite : Icons.favorite_border,
                        size: 33.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'JosefinSans',
                      ),
                    ),
                    Text(
                      '0.0 Km away',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'JosefinSans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                RatingStar(rating: widget.restaurant.rating, starSize: 20.0),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'JosefinSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 5.0,
                      color: Color(0xffed2939),
                      onPressed: () {},
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 5.0,
                      color: Color(0xffed2939),
                      onPressed: () {},
                      child: Text(
                        "Contact",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontFamily: 'JosefinSans',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*we dont gave fixed height to the grifview thats why it is creating height issue*/
          Expanded(
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 10.0,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food food = widget.restaurant.menu[index];
                  return MenuStackTiles(food);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
