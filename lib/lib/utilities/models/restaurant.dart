import 'package:shareweb/utilities/models/food.dart';

class Gastronomie {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final List<Food> menu;

  Gastronomie({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
  });
}
