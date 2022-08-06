import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/model/Restaurent.dart';
import 'package:foodapp/screen/HomeSearchBar.dart';
import 'package:foodapp/screen/RecentOrder.dart';
import 'package:foodapp/screen/RestaurantScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> RestaurantList = [];

    restaurants.forEach((Restaurant restaurant) {
      RestaurantList.add(GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RestaurantScreen(restaurant: restaurant)));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 12),
          height: 150,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    child: Image(
                        width: 200,
                        fit: BoxFit.cover,
                        image: AssetImage('${restaurant.imageUrl}')),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${restaurant.name}',
                        style: TextStyle(
                            fontSize: 22,
                            height: 3,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '${restaurant.address}',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w700),
                      ),
                      Text('⭐  ${restaurant.rating}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return Column(children: RestaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        leading: Icon(
          Icons.account_circle,
          size: 35,
        ),
        title: Text("Food Delivery App"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Cart(${currentUser.cart?.length})",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeSearchBar(),
                RecentOrder(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Near Me Restaurant",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    buildRestaurant(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
