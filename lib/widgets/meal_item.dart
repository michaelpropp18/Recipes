import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {@required this.title,
      @required this.imageURL,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: selectMeal,
        child: Card(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(imageURL,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ),
                  ],
                )
              ],
            ),
            elevation: 4,
            margin: const EdgeInsets.all(19),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))));
  }
}
