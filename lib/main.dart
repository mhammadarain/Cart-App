import 'package:cart_provider/pages/cart_page.dart';
import 'package:cart_provider/pages/products_page.dart';
import 'package:cart_provider/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>CartProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: "/products",
      routes: {
        "/products": (context)=> ProductsPage(),
        "/cart": (context)=> CartPage(),
      },
    );
  }
}