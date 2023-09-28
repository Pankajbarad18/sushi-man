// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiman/Data/Model/FoodModel.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Like
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                ),
                Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            //Image
            Image.asset(
              food.imgpath,
              width: 140,
            ),

            const SizedBox(
              height: 20,
            ),

            //text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 24),
            ),

            const SizedBox(
              height: 10,
            ),

            //Price and Rating
            SizedBox(
              width: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs. ${food.price}",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  //rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 24,
                        color: Color.fromARGB(255, 236, 220, 73),
                      ),
                      Text(
                        food.rating,
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
