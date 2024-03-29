import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:roadmap/utilities/AppTheme.dart';

import 'category/allCategoriyes/category_list.dart';
import 'home/view.dart';
import 'profile/menu_profile.dart';

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
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.whatshot,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
        ],
        color: AppTheme.bottomAppBar,
        backgroundColor: Color(0xFF13131D),
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
