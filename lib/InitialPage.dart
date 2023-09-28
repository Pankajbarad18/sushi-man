// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiman/Components/MyButton.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _circle;
  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    )..forward();

    _circle = Tween(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(parent: animation, curve: Curves.bounceIn));

    animation.addListener(() {
      setState(() {});
    });

    animation.addStatusListener((status) {
      if (status == animation.isCompleted) {
        animation.reverse();
      } else if (status == animation.isDismissed) {
        animation.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 104, 39, 35),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),

            //company Name
            Text(
              "SUSHI MAN",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 30, color: Colors.white),
            ),

            const SizedBox(
              height: 25,
            ),

            //icon
            Transform.rotate(
              angle: _circle.value,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset("lib/Images/logo.png"),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
            ),

            const SizedBox(
              height: 20,
            ),

            //subtitle
            Text(
              "Feel the taste of most popular japanese food from anywhere and anytime",
              style:
                  TextStyle(fontSize: 20, color: Colors.grey[200], height: 2),
            ),

            const SizedBox(
              height: 20,
            ),

            //Button
            MyButton(
              btntext: "Get Started",
              onTap: () => Navigator.pushNamed(context, 'HomePage'),
              arrow: true,
            )
          ],
        ),
      ),
    );
  }
}
