import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/Data/food_data.dart';
import 'package:food_app/Providers/filtered_provider.dart';

  final mealProvider=Provider((ref){
    final choosedFilter=ref.watch(filteredmealProvider);
    return mealExplain.where((meal){
if(choosedFilter[Filter.glutenFree]! && !meal.isGlutenFree){
return false;
}
if(choosedFilter[Filter.lactoseFree]! && !meal.isLactoseFree){
return false;
}
if(choosedFilter[Filter.vegetarian]! && !meal.isVegetarian){
return false;
}
if(choosedFilter[Filter.vegan]! && !meal.isVegan){
return false;
}
return true;
}).toList();
});