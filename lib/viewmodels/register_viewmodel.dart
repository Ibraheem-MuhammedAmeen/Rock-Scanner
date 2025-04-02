import 'package:flutter/material.dart';
import '../auth/auth.dart';

class RegisterViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> registerUser(String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners(); // Notify UI to show a loading state

    final user = await _authService.signUpWithEmailPassword(email, password, context);

    _isLoading = false;
    notifyListeners(); // Notify UI to hide the loading state

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/login'); // Navigate to login after success
    }
  }
}
