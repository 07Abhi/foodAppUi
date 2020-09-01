import 'package:flutter_food_delivery_ui/screens/cartscreen.dart';
import 'package:flutter_food_delivery_ui/screens/profile.dart';
import 'package:flutter_food_delivery_ui/screens/restaurantscreen.dart';
import 'package:flutter_food_delivery_ui/widgets/ratingstar.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/recents.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/icons/carticon.dart';

List<String> restaurantSearch = [
  'Restaurant 0',
  'Restaurant 1',
  'Restaurant 2',
  'Restaurant 3',
  'Restaurant 0'
];

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textKey = GlobalKey<AutoCompleteTextFieldState>();
  final _textController = TextEditingController();
  final focus = FocusNode();
  Route _pageAnimationRestra(Restaurant restra) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RestaurantScreen(restaurant: restra),
        //transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInExpo;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });
  }

  Route _pageAnimationCart() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CartScreen(),
      //transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _pageAnimationProfile() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryanimation) => Profile(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeOutBack;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offSetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offSetAnimation,
          child: child,
        );
      },
    );
  }

  _buildRestuarantsList() {
    List<Widget> restroList = [];
    restaurants.forEach(
      (Restaurant restra) {
        restroList.add(
          GestureDetector(
            onTap: () => Navigator.push(context, _pageAnimationRestra(restra)),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1.0, color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Hero(
                        tag: restra.imageUrl,
                        child: Image(
                          image: AssetImage(restra.imageUrl),
                          height: 150.0,
                          width: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            restra.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).accentColor,
                                fontSize: 18.0),
                          ),
                          SizedBox(height: 5.0),
                          RatingStar(
                            rating: restra.rating,
                            starSize: 16.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Nearby Place Name',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500,
                                fontSize: 16.0),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '0 Km away',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500,
                                fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(
      children: restroList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.push(context, _pageAnimationProfile()),
          icon: Icon(
            CupertinoIcons.profile_circled,
            size: 35.0,
          ),
        ),
        title: Text(
          'Foodiezzz',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
              letterSpacing: 1.2),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(context, _pageAnimationCart()),
            child: CartIcon(
              items: currentUser.cart.length,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            child: AutoCompleteTextField(
              focusNode: focus,
              clearOnSubmit: false,
              controller: _textController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // Focus.of(context).unfocus();
                    _textController.clear();
                  },
                  color: Colors.black45,
                ),
                hintText: 'Search Resautrant',
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      width: 1.0, color: Theme.of(context).accentColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2.0, color: Colors.yellow)),
              ),
              itemSubmitted: (suggestion) {},
              key: textKey,
              suggestions: restaurantSearch,
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                  trailing: Text('x km away'),
                );
              },
              itemFilter: (item, query) {
                return item.toLowerCase().startsWith(query.toLowerCase());
              },
              itemSorter: (a, b) {
                return a.compareTo(b);
              },
            ),
          ),
          Recents(),
          SizedBox(height: 5.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restuarants',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Ubuntu'),
                ),
              ),
              _buildRestuarantsList()
            ],
          ),
        ],
      ),
    );
  }
}

/*Some Animation b/w transitions*/
