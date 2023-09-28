// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiman/Components/MyButton.dart';
import 'package:sushiman/Constants.dart';
import 'package:sushiman/Data/Model/FoodModel.dart';
import 'package:sushiman/Data/Shop.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

int quantity = 0;

class _FoodDetailPageState extends State<FoodDetailPage> {
  void increment() {
    setState(() {
      setState(() {
        quantity++;
      });
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void addtoCart() {
    if (quantity > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantity);

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: ((context) => AlertDialog(
                content: const Text("SuccessFully Added to cart"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.done))
                ],
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    List foodIngredients = ["Rice", "Tuna", "Soup", "Powder", "Salt"];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 40,
                          color: PrimaryColor,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: 40,
                        color: PrimaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Image
                  Image.asset(widget.food.imgpath, height: 200),

                  const SizedBox(
                    height: 20,
                  ),

                  //Rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 28,
                        color: Color.fromARGB(255, 236, 220, 73),
                      ),
                      Text(
                        widget.food.rating,
                        style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 40, color: PrimaryColor),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Ingredients
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foodIngredients.length,
                        itemBuilder: ((context, index) =>
                            Text(foodIngredients[index]))),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Description
                  Text(
                    "Description",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Description Of the first product we have to give some proper description for the food that is shown here.Description Of the first product we have to give some proper description for the food that is shown here.Description Of the first product we have to give some proper description for the food that is shown here.Description Of the first product we have to give some proper description for the food that is shown here.Description Of the first product we have to give some proper description for the food that is shown here.",
                    style: TextStyle(fontSize: 20, height: 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs. ${widget.food.price}",
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 28, color: Colors.white),
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: ButtonColor,
                                  borderRadius: BorderRadius.circular(100)),
                              child: IconButton(
                                  onPressed: decrement,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ))),
                          Text(
                            "$quantity",
                            style: GoogleFonts.dmSerifDisplay(
                                fontSize: 28, color: Colors.white),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ButtonColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                                onPressed: increment,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(btntext: "Buy Now", onTap: addtoCart, arrow: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}
