// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiman/Components/Foodtile.dart';
import 'package:sushiman/Components/MyButton.dart';
import 'package:sushiman/Components/PopularfoodTile.dart';
import 'package:sushiman/Constants.dart';
import 'package:sushiman/Data/Shop.dart';
import 'package:sushiman/FoodDetailsPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final FoodItems = shop.FoodItems;
    void NavigatorFunc(int index) {
      final shop = context.read<Shop>();
      final FoodItems = shop.FoodItems;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoodDetailPage(
                    food: FoodItems[index],
                  )));
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[900],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: Center(
          child: Text(
            "Bangalore",
            style:
                GoogleFonts.dmSerifDisplay(fontSize: 20, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, 'CartPage'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo code
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: PrimaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //discount promo code
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //button
                    MyButton(
                      btntext: "Buy Food",
                      onTap: () {},
                      arrow: false,
                    )
                  ],
                ),
                //image
                Image.asset(
                  "lib/Images/sushi (4).png",
                  width: 100,
                )
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //search bar
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Here...",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),

          //product
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
            child: Text(
              "Food Menu",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 24, color: Colors.black),
            ),
          ),

          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: FoodItems.length,
                  itemBuilder: ((context, index) => FoodTile(
                        food: FoodItems[index],
                        onTap: () => NavigatorFunc(index),
                      )))),

          //popular food
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Text(
              "Popular Food",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 24, color: Colors.black),
            ),
          ),
          PopularFood(food: FoodItems[0])
        ],
      ),
    );
  }
}
