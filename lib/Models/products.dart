// create the models for the pets
import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, id;

  Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.description});
}

List<Product> products = [
  Product(
    id: 1,
    title: "Baby Dog",
    price: 100,
    description: dummydisc,
    image: 'assets/images/dog3.png',
  ),
  Product(
    id: 1,
    title: "Baby cat",
    price: 75,
    description: dummydisc,
    image: 'assets/images/cat1.png',
  ),
  Product(
    id: 1,
    title: "Baby Dog",
    price: 100,
    description: dummydisc,
    image: 'assets/images/dog2.png',
  ),
  Product(
    id: 1,
    title: "Baby cat",
    price: 80,
    description: dummydisc,
    image: 'assets/images/cat2.png',
  ),
  Product(
    id: 1,
    title: "Baby Dog",
    price: 120,
    description: dummydisc,
    image: 'assets/images/dog1.png',
  ),
  Product(
    id: 1,
    title: "Baby cat",
    price: 90,
    description: dummydisc,
    image: 'assets/images/cat3.png',
  ),
];

String dummydisc = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. ';
