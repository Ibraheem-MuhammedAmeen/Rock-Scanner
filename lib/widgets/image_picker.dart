import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rock_scanner/service/gemini_service.dart';

class ImagesPicker {
  var geminiService = GeminiService();
  Future<void> pickImageAndScan(
      ImageSource source, BuildContext context) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageFile = File(image.path);
    await geminiService.askAiToScan(
      imageFile: imageFile,
      context: context,
    );
  }
}
