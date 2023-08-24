
import 'package:flutter/material.dart';
import 'package:food_app/Screens/mealScreen.dart';
 import 'package:food_app/models/category.dart';

class GridItems extends StatelessWidget {
  const GridItems({ required  this.category, required this.selectedCategory, super.key});
  final Category category;
 final void Function() selectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: selectedCategory,
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) ,
        gradient: LinearGradient(colors: [
          category.color.withOpacity(0.51),
          category.color.withOpacity(0.86)
        ],
        begin: Alignment.bottomLeft,
        end:Alignment.topRight ),
        ),
        child: Text(category.title,
      style:Theme.of(context).textTheme.titleLarge!.copyWith(
          color:Theme.of(context).colorScheme.background)),
      ),
    );
  }
}
