import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_scanner/theme/const.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/scan_button.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 65, bottom: 16),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topCenter, // Aligns at the top center
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
                  //pickImageAndScan(ImageSource.camera);
                },
                label: 'Take a picture',
                icon: Ionicons.camera_reverse_outline,
              ),
              const SizedBox(height: 20),
              ScanButton(
                onTap: () {
                  //pickImageAndScan(ImageSource.gallery);
                },
                label: 'From Gallery',
                icon: Ionicons.image_outline,
              ),
              const SizedBox(height: 20),
              TextButton(
                style: RockSignButton,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text(
                  "Sign In to Rock-Scan",
                  style: RockSignIn,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
