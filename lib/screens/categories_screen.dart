import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';

import '../models/meals.dart';
import '../widgets/category_grid_item.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});

  final Function(Meal meal) onToggleFavorite;

  _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals, onToggleFavorite: onToggleFavorite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: () { _selectedCategory(context, category); },)
        ],
      ),
    );
  }
}