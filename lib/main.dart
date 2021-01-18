import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:roadmap/webservices/auth/auth.dart';

import 'screens/splash_screen.dart';

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
