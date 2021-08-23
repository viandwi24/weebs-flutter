import 'package:flutter/material.dart';
import 'package:weebs/constant.dart';
import 'package:weebs/screens/app_screen.dart';

void main() {
  runApp(WeebsApp());
}

class WeebsApp extends StatelessWidget {
  const WeebsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weebs',
      theme: ThemeData(
        fontFamily: kFontFamily
      ),
      home: AppScreen(),
    );
  }
}