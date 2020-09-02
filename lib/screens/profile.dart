import 'package:flutter_food_delivery_ui/widgets/profiletiles.dart';
import 'package:flutter_food_delivery_ui/widgets/topbar.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 550.0,
            child: Stack(
              children: [
                ClipPath(
                  clipper: MyCustomPathClipper(),
                  child: Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/profileback.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Align(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage('assets/images/userpicture.jpg'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Ben Affleck',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'emailaddress@mail.com',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30.0,
                  child: Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.0, color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileTiles(
                          icon: Icons.favorite,
                          text: 'Bookmarks',
                        ),
                        ProfileTiles(
                          icon: Icons.notifications,
                          text: 'Notifications',
                        ),
                        ProfileTiles(
                          icon: Icons.payment,
                          text: 'Payments',
                        ),
                      ],
                    ),
                  ),
                ),
                TopBar(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
            child: Text(
              'Send us feedback',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
            child: Text(
              'Rate us on playstore',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
            child: Text(
              'Log out',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
