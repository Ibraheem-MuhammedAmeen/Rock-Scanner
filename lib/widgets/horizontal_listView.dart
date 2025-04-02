import 'package:flutter/material.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';

import '../screens/rocks_type.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({
    super.key,
    required this.Name,
    required this.onTap,
    required this.isSelected,
  });
  final bool isSelected;
  final String Name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //condition ? expressionIfTrue : expressionIfFalse;
          //backgroundColor: AppColors.cardLight,
          backgroundColor:
              isSelected ? AppColors.IconBackground : AppColors.cardLight,
        ),
        onPressed: onTap,
        child: Text(
          Name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
