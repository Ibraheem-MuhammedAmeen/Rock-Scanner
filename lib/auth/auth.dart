import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_scanner/screens/login_screen.dart';

import '../screens/home_screen.dart';
import '../screens/navigation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmailPassword(
    String email,
    String password,
    BuildContext context, // Pass context here
  ) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please fill out all fields correctly!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        return null;
      }
      if (!email.contains('@')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Invalid email! Please enter a valid email address.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        return null;
      }
      email.trim();
      password.trim();
      dynamic userCredential;

      try {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NavigationPage()),
        );
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect Email or Password')),
        );
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        // Show Snackbar for invalid input
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please fill out all fields correctly!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        // return;
      }
      if (!email.contains('@')) {
        // Show Snackbar for invalid input
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Invalid email! Please enter a valid email address.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      email.trim();
      password.trim();
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$e',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  Future<String?> getCurrentUser() async {
    return _auth.currentUser?.email;
  }

  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  Future<String?> deleteAccount(BuildContext context) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.delete();

        return "Account deleted successfully";
      } else {
        return "No user signed in";
      }
    } on FirebaseAuthException catch (e) {
      // Some accounts need re-auth before delete
      if (e.code == 'requires-recent-login') {
        return "You need to re-authenticate before deleting the account.";
      }
      return "Delete failed: ${e.message}";
    } catch (e) {
      return "Unexpected error: $e";
    }
  }
}
