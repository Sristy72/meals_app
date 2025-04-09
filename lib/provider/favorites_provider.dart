import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>>{
  FavoritesMealsNotifier() : super([])/*initializer favorite meal list that should be empty*/;

  bool toggleMealFavoritesStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);
    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref){
  return FavoritesMealsNotifier();
});

