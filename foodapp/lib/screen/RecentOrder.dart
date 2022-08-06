import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/model/food.dart';
import 'package:foodapp/model/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);

  _BuildRecentOrder(BuildContext context, Order order) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orangeAccent),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 150,
                  width: 120,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20)),
                    child: Image(
                      image: AssetImage('${order.food?.imageUrl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${order.restaurant?.name}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            height: 2),
                      ),
                      Text(
                        "${order.restaurant?.address}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 2),
                      ),
                      Text(
                        "Rating ⭐ ${order.restaurant?.rating}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 2),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.add,
                      size: 35,
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Recent Order",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.orders![index];

                return _BuildRecentOrder(context, order);
              }),
        ),
      ],
    );
  }
}
