import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:historical_spots/ui/pages/detail_page/detail_page.dart';
import 'package:historical_spots/ui/pages/home_page/home_page.dart';
import 'package:historical_spots/ui/pages/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
              builder: (context) => SplashPage(),
            );
          case '/home':
            return CupertinoPageRoute(
              builder: (context) => HomePage(),
            );

          case '/detail':
            return CupertinoPageRoute(
              builder: (context) => DetailPage(xid: settings.arguments as String,),
            );
        }
      },
    );
  }
}
