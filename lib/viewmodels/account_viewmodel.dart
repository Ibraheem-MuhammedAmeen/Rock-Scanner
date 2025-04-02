import 'package:flutter/cupertino.dart';

import '../auth/auth.dart';

class AccountView with ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _userEmail;

  String? get userEmail => _userEmail;

  Future<void> fetchCurrentUser() async {
    _userEmail = await _authService.getCurrentUser();
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    await _authService.logout(context);
    _userEmail = null;
    notifyListeners();
  }
}
