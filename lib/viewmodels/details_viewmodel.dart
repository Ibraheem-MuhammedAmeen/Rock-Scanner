import 'package:flutter/cupertino.dart';
import 'package:rock_scanner/service/gemini_service.dart';

class DetailsView with ChangeNotifier {
  GeminiService _geminiService = GeminiService();
  String? _data;
  String? get data => _data;

  Future<void> fetchCurrentUser(String message) async {
    try {
      _data = await _geminiService.generateText(message);
      notifyListeners(); // Let the UI know things changed
    } catch (e) {
      print('Error fetching response from Gemini: $e');
    }
  }
}
