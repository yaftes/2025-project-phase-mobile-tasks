import 'package:e_commerce/screens/add_update_page.dart';
import 'package:e_commerce/screens/detail_page.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/search_product_page.dart';
import 'package:flutter/material.dart';

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
