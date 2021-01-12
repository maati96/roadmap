import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/utilities/Shared.dart';

import 'auth/SignIn/view.dart';
import 'package:roadmap/screens/start.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override

//  var _visible = true;
//
////  AnimationController animationController;
//  Animation<double> animation;
//
//  startTime() async {
//    var _duration = new Duration(seconds: 3);
//    return new Timer(_duration, navigationPage);
//  }
//
//  void navigationPage() {
//    // Navigator.of(context).pushNamed('/');
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    animationController = new AnimationController(
////        vsync: this,
//
//        duration: new Duration(seconds: 2));
//    animation =
//        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
//
//    animation.addListener(() => this.setState(() {}));
//    animationController.forward();
//
//    setState(() {
//      _visible = !_visible;
//    });
//    startTime();
//  }


  void initState() {
    Timer(Duration(seconds: 3), () {
      Prefs.getStringF("token").then((value) {
        if (value != null && value != "") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => StartNavigationButtom()));
          /*  return StartNavigationButtom();*/
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignInView()));

//            return SignInView();
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
