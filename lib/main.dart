import'package:flutter/material.dart';
import 'package:food_app/Screens/homeScreen.dart';
import 'package:food_app/Screens/tabScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final theme=ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor:  const Color.fromARGB(245, 131, 80, 10),
  //brightness: Brightness.dark
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);


void main(){
  runApp( const ProviderScope(child: myApp(),));
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabScreen(),

    );
  }
}
