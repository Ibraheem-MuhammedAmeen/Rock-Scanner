import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  late final String apiKey;
  late final String apiUrl;

  GeminiService() {
    apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";
    apiUrl =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey";
  }
  Future<String> generateText(String prompt) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data['candidates'][0]['content']['parts'][0]['text']);
      return data['candidates'][0]['content']['parts'][0]['text'] ??
          "No response";
    } else {
      throw Exception("Failed to fetch response: ${response.body}");
    }
  }
}
