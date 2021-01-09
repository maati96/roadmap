import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:roadmap/screens/category/category_list.dart';
import 'package:roadmap/screens/home.dart';

import 'profile/profile.dart';

class StartNavigationButtom extends StatefulWidget {
  final String data;

  StartNavigationButtom({this.data});

  @override
  _StartNavigationButtomState createState() => _StartNavigationButtomState();
}

class _StartNavigationButtomState extends State<StartNavigationButtom> {
  int _page = 1;

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    List<Widget> tabs = [
      CategoryList(),
      //Favorites(),
      Home(),
      UserProfile(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        key: _bottomNavigationKey,
        items: [
          Icon(
            Icons.calendar_view_day,
            color:
              Color(0xFF26242e),
            size: 30,
          ),
          // Icon(
          //   Icons.favorite,
          //   color: Color(0xFF8890A6),
          //   size: 30,
          // ),
          Icon(
            Icons.whatshot,
            color:  Color(0xFF26242e),
            size: 30,
          ),
          Icon(
            Icons.person,
            color:  Color(0xFF26242e),
            size: 30,
          ),
        ],
        color: Colors.white70,
        backgroundColor: Colors.grey[400],
        animationCurve: Curves.easeInOut,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: tabs[_page],
    );
  }
}
