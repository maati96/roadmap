
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:roadmap/routes.dart';
import 'package:roadmap/webservices/auth/auth.dart';


final storage = FlutterSecureStorage();

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
          builder: (BuildContext context) => generateRoute(
            context: context,
            name: settings.name,
            arguments: settings.arguments,
          ),
        );
      },
    );
  }
}
