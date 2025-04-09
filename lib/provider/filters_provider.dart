import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum filters{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterNotifier extends StateNotifier<Map<filters, bool>> {
  FilterNotifier() : super({ //initial filter state
    filters.glutenFree: false,
    filters.lactoseFree: false,
    filters.vegetarian: false,
    filters.vegan: false
  });

  setFilters(Map<filters, bool> chosenFilters){
    state = chosenFilters;
  }

  setFilter(filters filter, bool isActive){
    state = {
      ...state,
      filter: isActive
    };
  }
}

final filterMealProvider = StateNotifierProvider<FilterNotifier, Map<filters, bool>>((ref){
  return FilterNotifier();
});

final filteredMealProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterMealProvider);
  return meals.where((meal) {
    if (activeFilters[filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});