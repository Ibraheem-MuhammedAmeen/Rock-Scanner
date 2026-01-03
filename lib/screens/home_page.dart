import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:rock_scanner/widgets/scan_button.dart';

import '../theme/const.dart';

import '../viewmodels/loading_provide.dart';
import '../widgets/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<LoadingProvider>(context).isLoading;
    return Scaffold(
      body: loading
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
                    ScanButton(
                      onTap: () {
                        ImagesPicker()
                            .pickImageAndScan(ImageSource.camera, context);
                      },
                      label: 'Take a picture',
                      icon: Ionicons.camera_reverse_outline,
                    ),
                    const SizedBox(height: 20),
                    ScanButton(
                      onTap: () {
                        ImagesPicker()
                            .pickImageAndScan(ImageSource.gallery, context);
                      },
                      label: 'From Gallery',
                      icon: Ionicons.image_outline,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
