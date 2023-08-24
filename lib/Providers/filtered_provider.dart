import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,

}

const kInitailFilter={
  Filter.glutenFree: false,
  Filter.vegetarian:false,
  Filter.lactoseFree:false,
  Filter.vegan:false,
};

class FilteredMealNotifier extends StateNotifier<Map<Filter,bool>>{
  FilteredMealNotifier() : super(kInitailFilter);

  void setFilter(Filter filter, bool isActive){
    state={
      ...state,filter: isActive
    };
  }
}










 final filteredmealProvider=
 StateNotifierProvider<FilteredMealNotifier,Map<Filter,bool>>((ref) =>FilteredMealNotifier());