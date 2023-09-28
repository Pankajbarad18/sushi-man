import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiman/CartPage.dart';
import 'package:sushiman/Data/Shop.dart';
import 'package:sushiman/HomePage.dart';
import 'package:sushiman/InitialPage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InitialPage(),
      routes: {
        'InitialPage': (context) => const InitialPage(),
        'HomePage': (context) => const HomePage(),
        'CartPage': (context) => const CartPage()
      },
    );
  }
}
