import 'package:flutter/material.dart';

class ProfileTiles extends StatelessWidget {
  final IconData icon;
  final String text;
  const ProfileTiles({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 27.0,
            color: Colors.grey.shade600,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1.0,
            ),
          )
        ],
      ),
    );
  }
}
