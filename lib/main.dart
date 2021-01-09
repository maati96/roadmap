
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:roadmap/screens/start.dart';
import 'screens/auth/login.dart';
import 'utilities/auth/auth.dart';

final storage = FlutterSecureStorage();

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
  Future<String> get tokenOrEmpty async {
    var key = await storage.read(key: "key");
    if (key == null) return "";
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roadmap',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: tokenOrEmpty,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data != "") {
            var str = snapshot.data;
            var key = str.split(".");
            if (key.length != 3) {
              return StartNavigationButtom();
            } else {
              return Login();
            }
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
