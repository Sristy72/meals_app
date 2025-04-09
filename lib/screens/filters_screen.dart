import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterMealProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
          children: [
            SwitchListTile(value: activeFilters[filters.glutenFree]!, onChanged: (ischecked){
              ref.read(filterMealProvider.notifier).setFilter(filters.glutenFree, ischecked);
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
        
            SwitchListTile(value: activeFilters[filters.lactoseFree]!, onChanged: (ischecked){
              ref.read(filterMealProvider.notifier).setFilter(filters.lactoseFree, ischecked);
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
        
            SwitchListTile(value: activeFilters[filters.vegetarian]!, onChanged: (ischecked){
              ref.read(filterMealProvider.notifier).setFilter(filters.vegetarian, ischecked);
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
        
            SwitchListTile(value: activeFilters[filters.vegan]!, onChanged: (ischecked){
              ref.read(filterMealProvider.notifier).setFilter(filters.vegan, ischecked);
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
    );
  }
}
