import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals.dart';
import '../provider/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meals,});
  final Meal meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meals);

    return Scaffold(
      appBar: AppBar(
          title: Text(meals.title),
        actions: [
          IconButton(onPressed: (){
            final wasAdded = ref.read(favoriteMealsProvider.notifier). toggleMealFavoritesStatus(meals);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(wasAdded ? 'Meal Added' : 'Meal Removed'),
              ),
            );
          }, icon: AnimatedSwitcher(duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(turns: animation, child: child,);
            },
            child: Icon(isFavorite ? Icons.star : Icons.star_border, key: ValueKey(isFavorite),),) )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meals.id,
              child: Image.network(
                meals.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
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
