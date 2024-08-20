import 'package:flutter/cupertino.dart';
import 'package:pico_user/presentation/configs/configs.dart';

import '../../data/model/item.dart';

const String appName = "PicoUser";

const String ksFontFamily = "ShantellSans";

const List<String> categories = ["Fruits", "Vegetables", "Diary", "Meat"];
const List<String> categry_image = [
  "$category/fruit.png",
  "$category/vegetable.png",
  "$category/diary.png",
  "$category/meat.png"
];

List<Item> bestSellingItem = [
  Item(0, 2000, "Fresh Carrot", "1Kg","$vegetable/carrot.png"),
  Item(1, 3000, "Eggplant", "1Kg","$vegetable/eggplant.png"),
  Item(3, 2500, "Arabic Ginger", "1Kg",  "$vegetable/ginger.png",),
  Item(4, 3500, "Fresh Lettuce", "1Kg","$vegetable/lettuce.png"),
  Item(5, 1700, "Fresh Potato", "1Kg","$vegetable/potato.png"),
  Item(6, 2000, "Red Pepper", "1Kg","$vegetable/red_pepper.png"),
  Item(7, 2000,  "Fresh Tomatoes", "1Kg","$vegetable/tomatoes.png"),
  Item(8, 2000, "Butternut", "1Kg","$vegetable/butternut.png"),
  Item(9, 2000, "Broccoli", "1Kg","$vegetable/broccoli.png"),
];
 
List<Item> carrot = [
  Item(0, 2000, "Organic Carrot", "1Kg","$vegetable/carrot.png"),
  Item(0, 2000, "Organic Carrot", "1Kg","$vegetable/carrot.png"),
  Item(0, 2000, "Organic Carrot", "1Kg","$vegetable/carrot.png"),
  Item(0, 2000, "Organic Carrot", "1Kg","$vegetable/carrot.png"),
];

List<Item> eggplant = [
  Item(1, 3000, "Fresh Eggplant", "1Kg","$vegetable/eggplant.png"),
  Item(1, 3000, "Fresh Eggplant", "1Kg","$vegetable/eggplant.png"),
  Item(1, 3000, "Fresh Eggplant", "1Kg","$vegetable/eggplant.png"),
  Item(1, 3000, "Fresh Eggplant", "1Kg","$vegetable/eggplant.png"),
];
List<Item> ginger = [
  Item(2, 2300, "Arabic Ginger", "1Kg","$vegetable/ginger.png"),
  Item(2, 2300, "Arabic Ginger", "1Kg","$vegetable/ginger.png"),
  Item(2, 2300, "Arabic Ginger", "1Kg","$vegetable/ginger.png"),
  Item(2, 2300, "Arabic Ginger", "1Kg","$vegetable/ginger.png"),
  Item(2, 2300, "Arabic Ginger", "1Kg","$vegetable/ginger.png"),
];
List<Item> freshPotato = [
  Item(3, 3500, "Fresh Potato", "1Kg","$vegetable/potato.png"),
  Item(3, 3500, "Fresh Potato", "1Kg","$vegetable/potato.png"),
  Item(3, 3500, "Fresh Potato", "1Kg","$vegetable/potato.png"),
  Item(3, 3500, "Fresh Potato", "1Kg","$vegetable/potato.png"),
  Item(3, 3500, "Fresh Potato", "1Kg","$vegetable/potato.png"),
  Item(3, 3500, "Fresh Potato", "1Kg","$vegetable/potato.png"),
];

List<Item> tomato = [
  Item(4, 1700, "Fresh Tomato", "1Kg","$vegetable/tomatoes.png"),
  Item(4, 1700, "Fresh Tomato", "1Kg","$vegetable/tomatoes.png"),
  Item(4, 1700, "Fresh Tomato", "1Kg","$vegetable/tomatoes.png"),
  Item(4, 1700, "Fresh Tomato", "1Kg","$vegetable/tomatoes.png"),
  Item(4, 1700, "Fresh Tomato", "1Kg","$vegetable/tomatoes.png"),
  Item(4, 1700, "Fresh Tomato", "1Kg","$vegetable/tomatoes.png"),
];

Map<int,List<Item>> cart = {
  0: carrot,
  1:eggplant,
  3:freshPotato,
  2: ginger,
  4:tomato
};
