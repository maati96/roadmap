import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth/login.dart';
import 'utilities/auth/auth.dart';

void main() async {
  
  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => Auth(),
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
      home: Login(),
    );
  }
}
