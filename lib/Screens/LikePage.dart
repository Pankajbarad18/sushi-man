// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Data/Model/Shop.dart';
import '../Widgets/Constants.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();

    return Scaffold(
        backgroundColor: PrimaryColor,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: shop.CartItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
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
          ],
        ));
  }
}
