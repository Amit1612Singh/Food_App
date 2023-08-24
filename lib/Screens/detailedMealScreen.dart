import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';

import '../Providers/favorite_provider.dart';



class DetailedMealScreen extends ConsumerWidget {
  const DetailedMealScreen({required this.meal ,super.key});

final Meal meal;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final  checkedFavorite=ref.watch(favoriteMealProvider).contains(meal);

    return Scaffold(
      appBar: AppBar(title:Text(meal.title),
      actions: [
        IconButton(

            tooltip:'favorite',
            onPressed:(){
            ref.read(favoriteMealProvider.notifier).toggleMealStatus(meal,context );

            },
            icon:AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),

                transitionBuilder: (child, animation) =>
                    RotationTransition(
                      turns:Tween(begin: 0.7,end: 1.0).animate(animation),
                      child: child,),
                child: Icon(checkedFavorite ?
            Icons.star : Icons.star_border,
                    size: 32,
                    key: ValueKey(checkedFavorite)),

            )
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Card(
             margin: const EdgeInsets.all(20),
               clipBehavior: Clip.hardEdge,
               elevation: 5,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
               child:  Hero(
                 tag: meal.id,
                 child: Image.network(
                     meal.imageUrl,
                     height: 260,
                 width: double.infinity,

                 fit: BoxFit.cover),
               ),
           ),
            const SizedBox(height: 5,),
           Text('Ingredients',
              style:Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Colors.black,
                fontWeight:FontWeight.bold
            ),
            ),
            const SizedBox(height: 10,),
            ... meal.ingredients.map((ingred) => Text(ingred,
              style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                  fontWeight:FontWeight.bold
            ),),),
            const SizedBox(height: 25,),
            Text('Steps',
  //  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 24)
              style:Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:Colors.black,
                  fontWeight:FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            ... meal. steps.map((step) => Padding(
              padding: const EdgeInsets.symmetric(horizontal:12,vertical: 12),
              child: Text(step,
                textAlign: TextAlign.center,
                style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight:FontWeight.bold
                ),),
            ),),



          ],
        ),
      ),
    );
  }
}
