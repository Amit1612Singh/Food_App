import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.inDrawerPickedScreen});


  final  void Function(String Selected) inDrawerPickedScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:double.infinity,
            color: Colors.cyan,
            child: Column(
              children: [
               Container(
                 height: 100,
                 width: 100,
                 decoration: const BoxDecoration(
                   shape: BoxShape.circle,
                     image:DecorationImage(image: AssetImage('assest/image/gymNew.jpg',),
                     fit: BoxFit.cover),
               ),
               ),
                const Text("Amit Singh",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),),
              ],
            ),
          ),

          DrawerHeader(

            decoration: BoxDecoration(
                gradient: LinearGradient(
                colors:[
                  Theme.of(context).colorScheme.primaryContainer,
                  Colors.red.withOpacity(0.4),
                  Colors.yellow.withOpacity(0.2),
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
                ] ,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )
            ),
            child:Row(
              children: [
               const Icon(Icons.fastfood,size: 58,
                   // color: Theme.of(context).colorScheme.primary
                    color: Color(0xFF128c7e),
                ),
                const SizedBox(width: 14,),
                Text(" Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
//fontWeight: FontWeight.bold
                ),
                )
              ],
            ),),
          ListTile(
            leading:const  Icon(Icons.restaurant,size: 28,color:Color(0xFF128c7e), ),
            title: Text(" Meal",  style: Theme.of(context).textTheme.titleSmall!.copyWith(
              //fontWeight: FontWeight.bold,
            fontSize: 21),
            ),
            onTap:(){
              inDrawerPickedScreen("meal");
            },
          ),
          ListTile(
            leading:const  Icon(Icons.settings,size: 28,color:Color(0xFF128c7e), ),
            title: Text("Filters",  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                //fontWeight: FontWeight.bold,
                fontSize: 21),
            ),
            onTap: (){
              inDrawerPickedScreen("filters");
            },
          ),
        ],
      )
    );
  }
}
