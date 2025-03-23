import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  List<String> _cartItems = [];

  List<String> get cartItems => _cartItems;

  void addItem(String item){
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(String item){
    _cartItems.remove(item);
    notifyListeners();
  }
}