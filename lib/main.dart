import 'screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xffba0020),
          accentColor: Color(0xffee2737),
          fontFamily: 'JosefinSans'),
      home: HomePage(),
    );
  }
}
