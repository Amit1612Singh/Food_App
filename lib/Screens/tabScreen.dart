import"package:flutter/material.dart";
import "package:food_app/Screens/FilteredMealScreen.dart";
import "package:food_app/Screens/homeScreen.dart";
import "package:food_app/widgets/drawer.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/Providers/meal_provider.dart';
import '../Providers/favorite_provider.dart';

import 'mealScreen.dart';

class TabScreen extends ConsumerStatefulWidget {
 const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {

  int _currentIndex=0;
  void selectPage(int index){
    setState(() {
      _currentIndex= index;
    });
  }
  void showScreen(String selected) async{
    Navigator.pop(context);
    if(selected =='filters'){
    Navigator.push(context,    MaterialPageRoute(builder: (context)=>
    const FilteredMealScreen()));
    }
    else{

     Navigator.push(context,MaterialPageRoute(builder:(context)=>const TabScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
final filteredAvailableMeal=ref.watch(mealProvider);

    Widget activePage= FoodCategoryScreen(
      filteredMeal:filteredAvailableMeal,
    );
    var activeTitle="Categories";
    if (_currentIndex==1){
      final favoriteMealScreen=ref.watch(favoriteMealProvider);
      activePage=  MealScreen(
        meals:favoriteMealScreen,
       // toggleMealFavorites: toggleMealStatus,
      );
      activeTitle= " Your Favorites Meal";
    }

    return Scaffold(
      drawer: MainDrawer(inDrawerPickedScreen: showScreen),
      appBar: AppBar(title: Text(activeTitle)),
      body: activePage,
      bottomNavigationBar:BottomNavigationBar(
        selectedFontSize: 17,
          unselectedFontSize: 14,
          onTap:selectPage,
           currentIndex:_currentIndex ,
      items: const [
        BottomNavigationBarItem(icon:Icon(Icons.set_meal),label: " category", ),
        BottomNavigationBarItem( icon: Icon(Icons.star),label: "Favorites")
      ]) ,
    );
  }
}
