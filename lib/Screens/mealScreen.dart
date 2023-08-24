import 'package:flutter/material.dart';
import 'package:food_app/Screens/detailedMealScreen.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meal_Item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title,required this.meals});
//final Category category;
  final String? title;
 final List<Meal>meals;
 // final void Function(Meal meal) toggleMealFavorites;
   void mealDetailed(Meal meal ,BuildContext context){
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=> DetailedMealScreen(meal: meal,
        )));
  }
  @override
  Widget build(BuildContext context) {
    Widget content= ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context,index)=>MealItems(
            meal: meals[index],
          tapDetailedScreen: (meal){
              mealDetailed(meal, context);
          },


          ),
    );
    if(meals.isEmpty){
      content=Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text( "Nothing here ! ",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context ).colorScheme.primary,
            )),
             const SizedBox(height: 10),
            Text("Choose your meal by Selecting Different Category",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context ).colorScheme.primary,))
          ],
        ),
      );
    }
if(title==null){
  return content;
}return Scaffold(
      appBar:AppBar(
        title:Text(title!),

      ),
      body:  content,
    );
  }
}
