import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/mealTrait.dart';
import 'package:transparent_image/transparent_image.dart';
class MealItems extends StatelessWidget {
  const MealItems({required this.meal,required this.tapDetailedScreen,super.key});

  final Meal meal;
  final void Function(Meal meal) tapDetailedScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
     clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: (){
          tapDetailedScreen(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag:meal.id,
              child: FadeInImage(
                fit: BoxFit.cover,
                 height: 230,
                  width: double.infinity,

                  placeholder:MemoryImage(kTransparentImage),
                  image:NetworkImage(meal.imageUrl)),
            ),
            Positioned(
              left: 0,
                right: 0,
                bottom: 0,

                child:Container(
                      padding: const EdgeInsets.symmetric(vertical:5,horizontal: 27),
                      color: Colors.black54,
                      //Colors.brown.withOpacity(0.5),
                       child: Column(
                         children: [
                           Text(meal.title,maxLines: 2,
                               softWrap: true,
                               overflow: TextOverflow.ellipsis,
                               textAlign:TextAlign.center,
                           style:const  TextStyle(fontSize:18,
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontStyle:FontStyle.italic)),
                           const SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     MealTrait(icon:Icons.schedule_outlined,label:"${meal.duration} min",),
                                     const SizedBox(width:8,),
                                     MealTrait(icon:Icons.work,
                                         label:meal.complexity.name[0].toUpperCase() +meal.complexity.name.substring(1)),
                                     const  SizedBox(width:8,),
                                       MealTrait(
                                             icon: Icons.attach_money,
                                             label:meal.affordability.name[0].toUpperCase() +meal.affordability.name.substring(1) ),
                                   ],
                               ),
                         ],
                       ),
                    ),

                )
          ],
        ) ,
      ),);
  }
}
