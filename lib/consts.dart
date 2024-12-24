import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Color color;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
});
}

final List<Product> PRODUCTS = [
  Product(id: 0, name: "Laptop", price: 999.99, color: Colors.amber),
  Product(id: 1, name: "Smartphone", price: 789.99, color: Colors.blue),
  Product(id: 2, name: "AirBuds", price: 299.99, color: Colors.purple),
  Product(id: 3, name: "SmartWatch", price: 550.99, color: Colors.deepOrange),
  Product(id: 4, name: "Charger", price: 159.99, color: Colors.green),
  Product(id: 5, name: "Tab", price: 899.99, color: Colors.brown),
];