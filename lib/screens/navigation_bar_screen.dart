import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meals.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {

 final List<Meal> _favoritesMeal = [];
 
 _showSnackBarMessage(String message) {
   ScaffoldMessenger.of(context).clearSnackBars();
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       content: Text(message),
     ),
   );
 }
 
 _toggleMealFavoritesStatus(Meal meal){
   final isExisting = _favoritesMeal.contains(meal);
   if(isExisting){
     setState(() {

     });
     _favoritesMeal.remove(meal);
     _showSnackBarMessage('Meal is no longer a favorite.');
   }
   else{
     setState(() {

     });
     _favoritesMeal.add(meal);
     _showSnackBarMessage('Marked as a favorite!');
   }
 }

 onSelectDrawer(String identifier) {
    if (identifier == 'filter') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return FiltersScreen();
          },
        ),
      );
    } else {}
  }

  int _selectedPageIndex = 0;
 _selectPage(int index){
   setState(() {

   });
   _selectedPageIndex = index;
 }
  @override
  Widget build(BuildContext context) {
   Widget activePage = CategoriesScreen(onToggleFavorite: (Meal meal) {_toggleMealFavoritesStatus(meal);},);
   var activePageTitle = 'Categories';

   if(_selectedPageIndex == 1){
     activePage = MealsScreen(meals: _favoritesMeal, onToggleFavorite: _toggleMealFavoritesStatus,);
     activePageTitle = 'favorites';
   }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onselect: (String identifier) { onSelectDrawer(identifier); },),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories'
          ),
          
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorites')
        ],
      ),
    );
  }
}
