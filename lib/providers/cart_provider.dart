import 'package:flutter/material.dart';

import '../models/equipment.dart';

class CartProvider
    extends ChangeNotifier {

  final List<Equipment>
  cartItems = [];

  List<Equipment>
  get items => cartItems;

  void addToCart(
      Equipment equipment
      ){

    cartItems.add(equipment);

    notifyListeners();
  }

  void removeFromCart(
      Equipment equipment
      ){

    cartItems.remove(equipment);

    notifyListeners();
  }

  int get totalPrice {

    int total = 0;

    for(var item in cartItems){

      total += item.price;
    }

    return total;
  }
}