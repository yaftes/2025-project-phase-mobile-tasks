import 'package:flutter/material.dart';

import 'screens/add_update_page.dart';
import 'screens/detail_page.dart';
import 'screens/home_page.dart';
import 'screens/search_product_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddUpdatePage(),
        '/update': (context) => AddUpdatePage(),
        '/detail': (context) => DetailPage(),
        '/search': (context) => SearchProductPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
