import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/model/Restaurent.dart';

class HomeSearchBar extends StatefulWidget {
  buildRestaurant() {
    List<Widget> restaurantList = [];

    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(Container());
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          hintText: "You Can Search Here your Desire Food",
          suffixIcon: Icon(Icons.close),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
