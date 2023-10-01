import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiman/Screens/CartPage.dart';
import 'package:sushiman/Data/Model/Shop.dart';
import 'package:sushiman/Screens/HomePage.dart';
import 'package:sushiman/Screens/InitialPage.dart';
import 'package:sushiman/Screens/LikePage.dart';

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
        'CartPage': (context) => const CartPage(),
        'LikePage': (context) => const LikePage()
      },
    );
  }
}
