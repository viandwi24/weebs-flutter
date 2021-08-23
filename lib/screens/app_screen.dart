import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weebs/constant.dart';
import 'package:weebs/screens/home/home_screen.dart';
import 'components/nav.dart';

class AppScreen extends StatefulWidget {
  AppScreen({Key key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _tabActiveIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onTabChange(BuildContext context, int index) {
    setState(() {
      _tabActiveIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomNavBottomScreen(
        active: _tabActiveIndex,
        pages: [
          HomeScreen(),
          Text('awekoawoke'),
          Text('123123'),
          Text('awekoawoke'),
        ]
      ),
      bottomNavigationBar: CustomNavBottom(
        onChange: _onTabChange,
        items: [
          CustomNavBottomItem(index: 0, active: _tabActiveIndex, title: 'Home', icon: Icons.home_sharp),
          CustomNavBottomItem(index: 1, active: _tabActiveIndex, title: 'Explore', icon: Icons.widgets_rounded),
          CustomNavBottomItem(index: 2, active: _tabActiveIndex, title: 'News', icon: Icons.explore_sharp),
          CustomNavBottomItem(index: 3, active: _tabActiveIndex, title: 'Love', icon: AntDesign.heart),
        ]
      ),
    );
  }
}