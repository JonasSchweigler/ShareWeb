import 'package:shareweb/utilities/models/food.dart';
import 'package:shareweb/utilities/models/restaurant.dart';

class Order {
  final Gastronomie gastronomie;
  final Food food;
  final String date;
  final int quantity;

  Order({
    this.date,
    this.gastronomie,
    this.food,
    this.quantity,
  });
}
