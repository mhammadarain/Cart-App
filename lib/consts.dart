import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Icon icon;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
});
}

final List<Product> PRODUCTS = [
  Product(id: 0, name: "Laptop", price: 999.99, icon: Icon(Icons.laptop_chromebook_outlined)),
  Product(id: 1, name: "Smartphone", price: 789.99, icon: Icon(Icons.mobile_screen_share_outlined)),
  Product(id: 2, name: "AirBuds", price: 299.99, icon: Icon(Icons.gif_box)),
  Product(id: 3, name: "SmartWatch", price: 550.99, icon: Icon(Icons.watch_outlined)),
  Product(id: 4, name: "Charger", price: 159.99,icon: Icon(Icons.power_outlined)),
  Product(id: 5, name: "TabLet", price: 899.99,icon: Icon(Icons.tablet)),
];