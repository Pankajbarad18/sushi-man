// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiman/Constants.dart';

class MyButton extends StatelessWidget {
  final String btntext;
  final Function()? onTap;
  final bool arrow;
  const MyButton(
      {super.key,
      required this.btntext,
      required this.onTap,
      required this.arrow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: ButtonColor, borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //Text
          Text(
            btntext,
            style:
                GoogleFonts.dmSerifDisplay(fontSize: 24, color: Colors.white),
          ),

          const SizedBox(
            width: 20,
          ),
          //arrow key
          if (arrow)
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            )
        ]),
      ),
    );
  }
}
