import 'package:flutter/material.dart';

class Template {
  final int id;
  final String title, description, price;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  bool isFavourite, isPopular;

  Template({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

List<Template> demoTemplates = [
  Template(
    id: 1,
    images: [
      "assets/images/color-4.png",
      "assets/images/color-5.png",
      "assets/images/color-2.png",
      "assets/images/color-7.png",
    ],
    colors: [
      Color(0xFFCD5C5C),
      Color(0xFF008080),
      Color(0xFF800080),
      Color(0xFF00008B),
    ],
    title: "Simple and Clean CV",
    price: "FREE",
    description: description,
    rating: 4.8,
    isPopular: true,
  ),
  Template(
    id: 2,
    images: [
      "assets/images/cv2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Professional CV",
    price: r"$3.9",
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Template(
    id: 3,
    images: [
      "assets/images/cv3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Modern CV",
    price: r"$2.6",
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Template(
    id: 4,
    images: [
      "assets/images/cv4.png",
    ],
    colors: [
      Color(0xFFCD5C5C),
      Color(0xFF008080),
      Color(0xFF696969),
      Color(0xFF00008B),
    ],
    title: "Minimalist CV",
    price: "FREE",
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
];

List<Template> favTemplates = [];

const String description =
    "A simple and clean CV that will help you boost your career...";