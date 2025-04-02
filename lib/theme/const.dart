import 'package:flutter/material.dart';

import '../auth/auth.dart';

const textTitle = TextStyle(
  color: Colors.white,
  fontSize: 19,
  fontWeight: FontWeight.normal,
  fontFamily: "Montserrat",
);
const textDec = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  fontFamily: "Montserrat",
);
const fontFam = TextStyle(
  fontFamily: 'Montserrat',
);
const RockSignIn = TextStyle(
  color: Colors.white, // Text color
  fontSize: 16,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
);
var RockSignButton = TextButton.styleFrom(
  padding:
      const EdgeInsets.symmetric(vertical: 14, horizontal: 45), // Adjust size
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20), // Rounded edges
    side: BorderSide(color: Colors.white, width: 2), // White border
  ),
  backgroundColor: Colors.black, // Button background color
);
//Register
var Register = (BuildContext context, _enteredEmail, _enteredPassword) {
  var _auth = AuthService();
  _auth.signUpWithEmailPassword(_enteredEmail, _enteredPassword, context);
};
