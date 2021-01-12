import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:roadmap/routes.dart';
import 'package:roadmap/screens/auth/SignIn/view.dart';
import 'package:roadmap/utilities/Shared.dart';
import 'package:roadmap/webservices/auth/auth.dart';

import 'screens/splash_screen.dart';
import 'screens/start.dart';

//final storage = FlutterSecureStorage();

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      title: 'Roadmap',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
      },
    );
  }
}
