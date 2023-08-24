import 'package:flutter/material.dart';
class MealTrait extends StatelessWidget {
  const MealTrait({required this.icon,required this.label,super.key});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Icon(icon,size: 20,color:Colors.white),
              const SizedBox(width:4 ,),
              Text(label,
                    style: const TextStyle(color: Colors.white,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),),
            ],

    );
  }
}
