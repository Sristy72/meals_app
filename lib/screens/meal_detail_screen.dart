import 'package:flutter/material.dart';

import '../models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meals, required this.onToggleFavorite});
  final Meal meals;
  final Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(meals.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavorite(meals);
          }, icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meals.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
        
            SizedBox(height: 14,),
        
            Text(
                'Ingredient',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold
                ),
              ),
        
            SizedBox(height: 14,),
            for(final ingredient in meals.ingredients)
              Text(
                  ingredient,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
        
            SizedBox(height: 24,),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold
              ),
            ),
        
            SizedBox(height: 14,),
            for(final step in meals.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                    step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  textAlign: TextAlign.center,
                  ),
                ),
            ],
        ),
      )
    );
  }
}
