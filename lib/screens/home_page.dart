import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:ionicons/ionicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rock_scanner/screens/scan_result.dart';

import '../theme/const.dart';
import '../theme/light_dark_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  String aiResult = "";
  Timer? timer;
  Future<void> pickImageAndScan(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageFile = File(image.path);
    await askAiToScan(imageFile);
  }

  void saveHistory({required String answer, required String base64Image}) {
    // Save your AI results here (local db, Hive, etc.)
  }

  Future<void> askAiToScan(File imageFile) async {
    try {
      setState(() {
        isLoading = true;
      });

      final apiKey = dotenv.env['GEMINI_API_KEY'];
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey!,
      );

      final imageBytes = await imageFile.readAsBytes();

      // Compress for Gemini
      final compressedImage = await FlutterImageCompress.compressWithList(
        imageBytes,
        minHeight: 1280,
        minWidth: 720,
        quality: 30,
      );

      const String scanQuery = "What kind of rock is this?";

      final prompt =
          TextPart(scanQuery); // scanQuery = "What kind of rock is this?"
      final imagePart = [DataPart('image/jpeg', compressedImage)];

      final content = [
        Content.multi([prompt, ...imagePart])
      ];

      final response = await model.generateContent(content);
      timer?.cancel(); // only if you have a timer in context

      setState(() {
        isLoading = false;
        aiResult = response.text!;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanResult(
              image: base64Encode(compressedImage), result: response.text),
        ),
      );

      saveHistory(
        answer: response.text!,
        base64Image: base64Encode(compressedImage),
      );
      print('this is the resultts$aiResult');
    } catch (e) {
      setState(() {
        isLoading = false;
        aiResult = "Failed to connect :(";
      });
      debugPrint("Error scanning rock: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 16),
                child: Column(
                  children: [
                    const Align(
                      alignment:
                          Alignment.topCenter, // Aligns at the top center
                      child: Text(
                        "Rock-Scan",
                        style: textTitle,
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Text(
                      'Scan your stone or',
                      style: textDec,
                    ),
                    const Text(
                      'upload from your gallery',
                      style: textDec,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        pickImageAndScan(ImageSource.camera);
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.IconBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.camera_reverse_outline,
                              size: 100,
                            ),
                            Text(
                              'Take a picture',
                              style: fontFam,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        pickImageAndScan(ImageSource.gallery);
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.IconBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.image_outline,
                              size: 100,
                            ),
                            Text(
                              'From Gallery',
                              style: fontFam,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
