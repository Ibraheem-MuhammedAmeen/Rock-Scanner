import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';

class ScanResult extends StatefulWidget {
  const ScanResult({super.key, required this.image, required this.result});

  final String image;
  final String? result;
  @override
  State<ScanResult> createState() => _ScanResultState();
}

class _ScanResultState extends State<ScanResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Container(
              width: 230,
              height: 480,
              decoration: BoxDecoration(
                just for contrast
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.memory(
                base64Decode(widget.image),
                fit: BoxFit.cover,
              ),
            ),*/
            Container(
              width: 230,
              height: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade300, //
                border: Border.all(
                  color: AppColors.IconBackground,
                  width: 5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.memory(
                  base64Decode(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            const Text(
              'Rock scanner results',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 14,
              ),
            ),
            const Text(
              'Rock scanner helps you Identify rocks',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
              ),
            ),
            Center(child: Expanded(child: Text(widget.result!)))
          ],
        ),
      ),
    );
  }
}
