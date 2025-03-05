import 'package:flutter/material.dart';
enum filters{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterCheck = false;
  var _lactoseFreeFilterCheck = false;
  var _vegetarianFilterCheck = false;
  var _veganFilterCheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop(
            {
              filters.glutenFree: _glutenFreeFilterCheck,
              filters.lactoseFree: _lactoseFreeFilterCheck,
              filters.vegetarian: _vegetarianFilterCheck,
              filters.vegan: _veganFilterCheck,
            }
          );
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(value: _glutenFreeFilterCheck, onChanged: (ischecked){
              _glutenFreeFilterCheck = ischecked;
              setState(() {
        
              });
            },
              title: Text('Gluten-free', style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSurface
              ),
              ),
              subtitle:Text('Only include gluten-free meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
              ),),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(value: _lactoseFreeFilterCheck, onChanged: (ischecked){
              _lactoseFreeFilterCheck = ischecked;
              setState(() {
        
              });
            },
              title: Text('Lactose-free', style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSurface
              ),
              ),
              subtitle:Text('Only include lactose-free meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              ),),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(value: _vegetarianFilterCheck, onChanged: (ischecked){
              _vegetarianFilterCheck = ischecked;
              setState(() {
        
              });
            },
              title: Text('Vegetarian', style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSurface
              ),
              ),
              subtitle:Text('Only include vegetarian meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              ),),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(value: _veganFilterCheck, onChanged: (ischecked){
              _veganFilterCheck = ischecked;
              setState(() {
        
              });
            },
              title: Text('Vegan', style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSurface
              ),
              ),
              subtitle:Text('Only include vegan meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              ),),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
