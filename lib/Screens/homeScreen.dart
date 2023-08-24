//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Data/food_data.dart';
import 'package:food_app/Screens/mealScreen.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/Category_grid_items.dart';
import 'package:food_app/models/category.dart';

class FoodCategoryScreen extends StatefulWidget {
  const FoodCategoryScreen({super.key,required this.filteredMeal});
  final List<Meal>filteredMeal;

  @override
  State<FoodCategoryScreen> createState() => _FoodCategoryScreenState();
}

class _FoodCategoryScreenState extends State<FoodCategoryScreen> with SingleTickerProviderStateMixin {

  late AnimationController animatedController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animatedController=AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 200),
        lowerBound: 0,
      upperBound: 1

    );
    animatedController.forward();
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }
   void _pickedCategory( BuildContext context,Category category){
     final filteredCategoryMeal=widget.filteredMeal.where((meal) =>meal.categories.contains(category.id)).toList();
     Navigator.push(context,
         MaterialPageRoute(builder:(context)=>
             MealScreen(title:category.title,
           meals:filteredCategoryMeal,
             )));


   }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animatedController,
        child: GridView(
          padding: const EdgeInsets.all(18),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18),

            children:[
              ... foodCategory.map((category) =>GridItems(category: category,
                selectedCategory:(){
                  _pickedCategory(context,category);
                } ,)),
              //alternative method :-
              // for(final category in foodCategory) GridItems(category: category)

            ]
        ),


      builder:(context,child)=>
      SlideTransition(
        position: Tween(
          begin: const Offset(0,0.3),
          end: const Offset(0,0)).animate(
          CurvedAnimation(
              parent: animatedController,
              curve: Curves.easeInOutCirc)),
        child: child,
      ),

    );
  }
}
