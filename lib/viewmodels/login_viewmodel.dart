import 'package:flutter/material.dart';
import '../auth/auth.dart';

class LoginViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners(); // Show loading indicator

    final user =
        await _authService.signInWithEmailPassword(email, password, context);

    _isLoading = false;
    notifyListeners(); // Hide loading indicator

    if (user != null) {
      Navigator.pushReplacementNamed(
          context, '/home'); // Navigate after successful login
    }
  }
}
