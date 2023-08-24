import 'package:flutter/material.dart';
import 'package:food_app/Providers/filtered_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class FilteredMealScreen extends ConsumerStatefulWidget {
  const FilteredMealScreen({super.key});

  @override
  ConsumerState<FilteredMealScreen> createState() => _FilteredMealScreenState();
}

class _FilteredMealScreenState extends ConsumerState<FilteredMealScreen> {

  void activeFilter(Filter filter,bool value){
    ref.read(filteredmealProvider.notifier).setFilter(filter,value);

  }

  @override
  Widget build(BuildContext context) {
final alreadySetFilter=ref.watch(filteredmealProvider);
    return Scaffold(
      appBar: AppBar(title: const Text(" Filter"),

      // leading: IconButton(icon: const Icon(Icons.arrow_back_ios),
      //     onPressed: (){Navigator.pop(context);}),

      ),

      body: Column(
        children: [
          SwitchListTile(
              value: alreadySetFilter[Filter.glutenFree]!,
              onChanged: (nowValue){
                ref.read(filteredmealProvider.notifier).setFilter(Filter.glutenFree, nowValue);
                // activeFilter(Filter.glutenFree, nowValue);
                },
          title: Text( "Gluten-Free",style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //color: Colors.green,
           // fontWeight: FontWeight.w600
          )),
          subtitle: Text("only include gluten-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
           // fontWeight: FontWeight.bold
          )),
          activeColor: Colors.green,),
          SwitchListTile(
            value:alreadySetFilter[Filter.lactoseFree]!,
            onChanged: (nowValue){
              activeFilter(Filter.lactoseFree, nowValue);
            },
            title: Text( "Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                   // fontWeight: FontWeight.w600
                )),
            subtitle: Text("only include Lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //  fontWeight: FontWeight.bold
                )),
            activeColor: Colors.green,),
          SwitchListTile(
            value:alreadySetFilter[Filter.vegetarian]!,
            onChanged: (nowValue){
              activeFilter(Filter.vegetarian, nowValue);
            },
            title: Text( "Vegetarian Food",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  //  fontWeight: FontWeight.w600
                )),
            subtitle: Text("it only include veg meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                   // fontWeight: FontWeight.bold
                )),
            activeColor:Colors.green,),
          SwitchListTile(
            value:alreadySetFilter[Filter.vegan]!,
            onChanged: (nowValue){
              activeFilter(Filter.vegan, nowValue);
            },
            title: Text( "Vegan Food",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  //  fontWeight: FontWeight.w600
                )),
            subtitle: Text("only include Vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                   // fontWeight: FontWeight.bold
                )),
            activeColor:Colors.green,),
        ],
      ),
    );
  }
}
