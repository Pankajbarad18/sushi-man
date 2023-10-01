// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiman/Data/Model/FoodModel.dart';

import '../Data/Model/Shop.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  final Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  bool liked = false;
  void addtoLike() {
    final shop = context.read<Shop>();
    shop.LikeItems.add(widget.food);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Like
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 130,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      liked = !liked;
                      addtoLike();
                    });
                  },
                  child: liked == true
                      ? const Icon(
                          Icons.favorite,
                          size: 30,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          size: 30,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            //Image
            Image.asset(
              widget.food.imgpath,
              width: 140,
            ),

            const SizedBox(
              height: 20,
            ),

            //text
            Text(
              widget.food.name,
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
                    "Rs. ${widget.food.price}",
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
                        widget.food.rating,
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
