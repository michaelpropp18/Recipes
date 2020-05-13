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

  String get complexityTest {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get affordabilityTest {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
        break;
    }
  }

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
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.schedule),
                            SizedBox(width: 6),
                            Text('$duration min'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.work),
                            SizedBox(width: 6),
                            Text(complexityTest),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            SizedBox(width: 6),
                            Text(affordabilityTest),
                          ],
                        )
                      ],
                    ))
              ],
            ),
            elevation: 4,
            margin: const EdgeInsets.all(19),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))));
  }
}
