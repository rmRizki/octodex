import 'package:flutter/material.dart';

import 'screens/detail_page.dart';
import 'screens/list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardTheme(elevation: 4.0),
        appBarTheme: AppBarTheme(elevation: 8.0),
      ),
      title: 'Octodex Gallery',
      initialRoute: '/',
      routes: {
        '/': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}
