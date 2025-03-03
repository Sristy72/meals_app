import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title, required this.meals, required this.onToggleFavorite});

  final Function(Meal meal) onToggleFavorite;

  final String? title;
  final List<Meal> meals;

  selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealDetailScreen(meals: meal, onToggleFavorite: (Meal meal) { onToggleFavorite(meal); },);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),

          SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );



    if(meals.isNotEmpty){
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealsItem(meals: meals[index], onSelectMeal: (Meal meal) { selectMeal(context, meal); },);
        },
      );
    }

    if(title == null){
      return content;
    }


    return Scaffold(
        appBar: AppBar(
        title: Text(title!),
        ),
        body: content
    );
  }
}
