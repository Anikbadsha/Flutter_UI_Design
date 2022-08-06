import 'Restaurent.dart';

import 'food.dart';

class Order {
  final String? date;
  final Restaurant? restaurant;
  final Food? food;
  final int? quantity;

  Order({this.date, this.restaurant, this.food, this.quantity});
}
