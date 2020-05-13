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
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        width: 250,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
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
