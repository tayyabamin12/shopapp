import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite = false;

  Product({this.id, this.title, this.description, this.price, this.imageUrl});

  void toggleFavorite(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}