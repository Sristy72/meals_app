import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../provider/favorites_provider.dart';
import '../provider/filters_provider.dart';

const kInitialFilters = {
  filters.glutenFree: false,
  filters.lactoseFree: false,
  filters.vegetarian: false,
  filters.vegan: false
};

class NavigationBarScreen extends ConsumerStatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  ConsumerState<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends ConsumerState<NavigationBarScreen> {

  onSelectDrawer(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filter') {
      final result = await Navigator.push<Map<filters, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return FiltersScreen();
          },
        ),
      );
    }
  }

  int _selectedPageIndex = 0;

  _selectPage(int index) {
    setState(() {});
    _selectedPageIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealProvider);

    Widget activePage = CategoriesScreen(
      availableMeal: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoritesMeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoritesMeal,
      );
      activePageTitle = 'favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onselect: (String identifier) {
          onSelectDrawer(identifier);
        },
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorites')
        ],
      ),
    );
  }
}
