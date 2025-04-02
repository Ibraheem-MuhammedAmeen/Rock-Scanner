import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/light_dark_theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.icon,
    required this.labelText,
    required this.onSaved,
  });
  final labelText;
  final String hintText;
  final IconData icon;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      style: TextStyle(color: Colors.white), // Change text color
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey), // Label color
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54), // Hint color
        filled: true,
        fillColor: Colors.black26, // Field background color
        suffixIcon: Icon(
          icon,
          color: Colors.white54,
        ), // Person icon at the end
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: AppColors.IconBackground, width: 2), // Focus border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.white54, width: 1), // Default border color
        ),
      ),
    );
  }
}
