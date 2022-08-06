import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodapp/model/Restaurent.dart';
import 'package:foodapp/model/food.dart';

class RestaurantScreen extends StatefulWidget {
  Restaurant? restaurant;
  RestaurantScreen({this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage('${widget.restaurant!.imageUrl}')),
                Positioned(
                    top: 12,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          size: 26,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.heat_pump_rounded,
                          size: 26,
                          color: Colors.white,
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '${widget.restaurant!.name}',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.restaurant!.address}',
              style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.normal),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 5,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20)),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Text(
                    "REVIEW FOOD",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent),
                  )),
            ),
            Text(
              "Top Menu's in our Restaurant",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    children:
                        List.generate(widget.restaurant!.menu!.length, (index) {
                      Food food = widget.restaurant!.menu![index];
                      return Container(
                          margin: EdgeInsets.all(8),
                          height: 180,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.orangeAccent,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    blurStyle: BlurStyle.normal)
                              ],
                              image: DecorationImage(
                                  image: AssetImage('${food.imageUrl}'),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                left: 25,
                                right: 25,
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  color: Colors.orangeAccent.withOpacity(0.75),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${food.name}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${food.price}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ));
                    }))),
          ],
        ),
      ),
    );
  }
}
