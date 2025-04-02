import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/light_dark_theme.dart';
class PassFieldWidget extends StatefulWidget {

  PassFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.onSaved,
  });

  final labelText;
  final String hintText;
  final void Function(String?)? onSaved;
  @override
  State<PassFieldWidget> createState() => _PassFieldWidgetState();
}

class _PassFieldWidgetState extends State<PassFieldWidget> {
  @override
  bool _isObscured = true;
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      obscureText: _isObscured,
      style: TextStyle(color: Colors.white), // Change text color
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.grey), // Label color
        hintText:widget.hintText,
        hintStyle: TextStyle(color: Colors.white54), // Hint color
        filled: true,
        fillColor: Colors.black26, // Field background color
        suffixIcon:
        IconButton(icon: Icon(
          _isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          color: Colors.white54,
        ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured; // Toggle obscure state
            });
          },), // Person icon at the end
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
