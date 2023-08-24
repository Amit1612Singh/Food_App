import 'package:food_app/models/meal.dart';
import 'package:riverpod/riverpod.dart';
import'package:flutter/material.dart';


class FavoriteMealNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealNotifier(): super([]);

  void showMessageFavorites(String message,BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text(message,
              style: const TextStyle(color: Colors.white,
              ),
              textAlign:TextAlign.center),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.black,));
  }

   void toggleMealStatus(Meal meal, BuildContext context){
     final favoriteMeal=state.contains(meal);
     if(favoriteMeal ){
       state=state.where((element) => element.id !=meal.id).toList();
       showMessageFavorites("${meal.title} is removed as Favorite",context);
      // return false;
     }
     else{
       state=[...state,meal];
       showMessageFavorites("${meal.title} is added as Favorite",context);
       //return true;
     }
   }

}





  final favoriteMealProvider=StateNotifierProvider<FavoriteMealNotifier,List<Meal>>((ref) =>FavoriteMealNotifier() );