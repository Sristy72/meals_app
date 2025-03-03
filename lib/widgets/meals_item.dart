import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meals.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meals, required this.onSelectMeal});

  final Meal meals;

  final Function(Meal meal) onSelectMeal;

  String get complexityText{
    return meals.complexity.name[0].toUpperCase() + meals.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meals.affordability.name[0].toUpperCase() + meals.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectMeal(meals);
        } ,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meals.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealsItemTrait(icon: Icons.schedule, label: "${meals.duration} min"),
                          SizedBox(width: 12,),
                          MealsItemTrait(icon: Icons.work, label: complexityText),
                          SizedBox(width: 12,),
                          MealsItemTrait(icon: Icons.attach_money, label: affordabilityText)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
