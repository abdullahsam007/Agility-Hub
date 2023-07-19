import 'package:flutter/material.dart';
import 'coffee_model.dart';

List<Coffee> _coffee_list = [
  Coffee(
    name: "Bag",
    image: "assets/store/Bag.jpg",
    backgroundColor: Color(0xff65C5B2),
    price: 5,
  ),
  Coffee(
    name: "Dumbells",
    image: "assets/store/Dumbells.jpg",
    backgroundColor: Color(0xffFFAEF2),
    price: 11,
  ),
  Coffee(
    name: "Leggings",
    image: "assets/store/Leggings.jpg",
    backgroundColor: Color(0xffFF9839),
    price: 7,
  ),
  Coffee(
    name: "Paints",
    image: "assets/store/Pants.jpg",
    backgroundColor: Color(0xffB68456),
    price: 4,
  ),
  Coffee(
    name: "Plates",
    image: "assets/store/Plates.jpg",
    backgroundColor: Color(0xffE74343),
    price: 9,
  ),
  Coffee(
    name: "Women shirt",
    image: "assets/store/Shirt Woman.jpg",
    backgroundColor: Color(0xff56B670),
    price: 12,
  ),
  Coffee(
    name: "Rod",
    image: "assets/store/Rod.jpg",
    backgroundColor: Color(0xff8D5FDC),
    price: 8,
  ),
  Coffee(
    name: "Shorts",
    image: "assets/store/Shorts.jpg",
    backgroundColor: Color(0xff5FBFDC),
    price: 15,
  ),
];

List<Coffee> get coffee_list {
  return [..._coffee_list];
}
