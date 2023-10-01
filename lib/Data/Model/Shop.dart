// ignore_for_file: file_names, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sushiman/Data/Model/FoodModel.dart';

class Shop extends ChangeNotifier {
  //food list
  final List<Food> _foodItems = [
    Food(
        name: "Sushi",
        price: "21",
        rating: "4.3",
        imgpath: "lib/Images/sushi.png"),
    Food(
        name: "Sushi1",
        price: "34",
        rating: "4.0",
        imgpath: "lib/Images/sushi (1).png"),
    Food(
        name: "Sushi2",
        price: "210",
        rating: "4.8",
        imgpath: "lib/Images/sushi (2).png"),
    Food(
        name: "Sushi3",
        price: "250",
        rating: "4.2",
        imgpath: "lib/Images/sushi (3).png"),
  ];

  //cart list
  List<Food> _cartItems = [];

  //Like Food
  List<Food> _likeItems = [];

  //getters
  List<Food> get FoodItems => _foodItems;
  List<Food> get CartItems => _cartItems;
  List<Food> get LikeItems => _likeItems;

  //add to cart
  void addToCart(Food food, int q) {
    for (int i = 0; i < q; i++) {
      _cartItems.add(food);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cartItems.remove(food);
    notifyListeners();
  }

  //add to Like
  void addToLike(Food food) {
    _likeItems.add(food);
    notifyListeners();
  }

  //remove from Like
  void removeFromLike(Food food) {
    _likeItems.remove(food);
    notifyListeners();
  }
}
