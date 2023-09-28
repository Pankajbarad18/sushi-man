// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiman/Data/Model/FoodModel.dart';

class PopularFood extends StatelessWidget {
  final Food food;
  const PopularFood({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Like
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     SizedBox(
          //       width: 130,
          //     ),
          //     Icon(
          //       Icons.favorite_border,
          //       size: 30,
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              Image.asset(
                food.imgpath,
                width: 60,
              ),

              const SizedBox(
                width: 40,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text
                  Text(
                    food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Price and Rating
                  SizedBox(
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs. ${food.price}",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        //rating
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 20,
                              color: Color.fromARGB(255, 236, 220, 73),
                            ),
                            Text(
                              food.rating,
                              style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.favorite_border,
            size: 30,
          ),
        ],
      ),
    );
  }
}
