import 'dart:convert';

import 'package:flutter/material.dart';

import '../theme/light_dark_theme.dart';

class ScanDetails extends StatelessWidget {
  const ScanDetails(
      {super.key,
      required this.base64Image,
      required this.result,
      required this.AppTitle});

  final String base64Image;
  final String result;
  final String AppTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTitle,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 19,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.textFaded,
                  width: 5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.memory(
                  base64Decode(base64Image),
                ),
              ),
            ),
            Card(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  result,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
