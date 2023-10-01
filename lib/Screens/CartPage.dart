// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiman/Components/MyButton.dart';
import 'package:sushiman/Widgets/Constants.dart';
import 'package:sushiman/Data/Model/Shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Center(child: Text("Cart Page")),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: shop.CartItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                        color: ButtonColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              shop.CartItems[index].imgpath,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Text(
                                  shop.CartItems[index].name,
                                  style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 24, color: Colors.white),
                                ),
                                Text(
                                  "Rs. ${shop.CartItems[index].price}",
                                  style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                shop.removeFromCart(shop.CartItems[index]);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15.0),
            child: MyButton(btntext: "Pay Now", onTap: () {}, arrow: true),
          )
        ],
      ),
    );
  }
}
