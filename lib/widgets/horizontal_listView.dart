import 'package:flutter/material.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({
    super.key,
    required this.Name,
    required this.onTap,
    required this.isPressed,
  });

  final String Name;
  final void Function()? onTap;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 143,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPressed ? AppColors.IconBackground : Colors.black12,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
        ),
        onPressed: onTap,
        child: Text(
          Name,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
