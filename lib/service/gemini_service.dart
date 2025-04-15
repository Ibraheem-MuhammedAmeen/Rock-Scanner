import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:rock_scanner/screens/history.dart';
import 'package:rock_scanner/service/history_service.dart';

import '../screens/scan_result.dart';
import '../viewmodels/loading_provide.dart';

class GeminiService {
  late final String apiKey;
  late final String apiUrl;

  var _historyService = HistoryService();
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
      //print(data['candidates'][0]['content']['parts'][0]['text']);
      return data['candidates'][0]['content']['parts'][0]['text'] ??
          "No response";
    } else {
      throw Exception("Failed to fetch response: ${response.body}");
    }
  }

  Future<void> askAiToScan({
    required BuildContext context,
    required File imageFile,
  }) async {
    final loading = Provider.of<LoadingProvider>(context, listen: false);
    try {
      loading.startLoading();

      final apiKey = dotenv.env['GEMINI_API_KEY'];
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey!,
      );

      final imageBytes = await imageFile.readAsBytes();
      final compressedImage = await FlutterImageCompress.compressWithList(
        imageBytes,
        minHeight: 1280,
        minWidth: 720,
        quality: 30,
      );

      final content = [
        Content.multi([
          TextPart("What kind of rock is this?"),
          DataPart('image/jpeg', compressedImage)
        ])
      ];

      final response = await model.generateContent(content);
      final resultText = response.text ?? "No result found";
      final base64Image = base64Encode(compressedImage);

      loading.stopLoading();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ScanResult(
            image: base64Image,
            result: resultText,
          ),
        ),
      );
      _historyService.saveHistory(
        answer: response.text!,
        base64Image: base64Encode(compressedImage),
      );
    } catch (e) {
      loading.stopLoading();
      debugPrint("Error scanning rock: $e");
    }
  }
}
