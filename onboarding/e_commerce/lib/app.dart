import 'package:flutter/material.dart';
import 'features/product/presentation/pages/add_product_page.dart';
import 'features/product/presentation/pages/detail_page.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'features/product/presentation/pages/search_product_page.dart';
import 'features/product/presentation/pages/update_product_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddProductPage(),
        '/update': (context) => UpdateProductPage(),
        '/detail': (context) => DetailPage(),
        '/search': (context) => SearchProductPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
