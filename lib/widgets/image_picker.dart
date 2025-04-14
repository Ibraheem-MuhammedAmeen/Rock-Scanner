import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rock_scanner/service/gemini_service.dart';

class ImagePicker {
  var geminiService = GeminiService();
  /*Future<void> pickImageAndScan({
    required ImageSource source,
    required BuildContext context,
    required void Function(String answer, String base64Image) onResult,
  }) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageFile = File(image.path);
    await askAiToScan(context: context, imageFile: imageFile, onResult: onResult);
  }*/
  Future<void> pickImageAndScan(
      ImageSource source, BuildContext context) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageFile = File(image.path);
    await geminiService.askAiToScan(
        imageFile: imageFile,
        context: context,
        onResult: (String answer, String base64Image) {});
  }
}
