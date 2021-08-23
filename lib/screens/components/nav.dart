import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weebs/constant.dart';

class CustomNavBottomScreen extends StatelessWidget {
  const CustomNavBottomScreen({
    Key key,
    @required this.pages,
    @required this.active,
  }) : super(key: key);
  final List<Widget> pages;
  final int active;

  @override
  Widget build(BuildContext context) {
    return this.pages[this.active];
  }
}

class CustomNavBottom extends StatelessWidget {
  const CustomNavBottom({
    Key key,
    @required this.onChange,
    @required this.items
  }) : super(key: key);
  final List<CustomNavBottomItem> items;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    List<Widget> itemsBuilder = [];
    for (CustomNavBottomItem item in items) {
      itemsBuilder.add(GestureDetector(
        onTap: () {
          this.onChange(context, item.index);
        },
        child: item,
      ));
    }
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.grey[200]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: itemsBuilder,
      ),
    );
  }
}

class CustomNavBottomItem extends StatelessWidget {
  const CustomNavBottomItem({
    Key key,
    @required this.index,
    @required this.active,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final int index;
  final int active;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: (this.active == this.index) ? AnimatedContainer(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        // width: MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Icon(
              this.icon,
              color: kBackgroundColor,
            ),
            SizedBox(width: 10),
            Text(
              this.title,
              style: TextStyle(
                color: kBackgroundColor
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ) : AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Icon(
              this.icon,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}