import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../theme/light_dark_theme.dart';

class RocksType extends StatefulWidget {
  const RocksType({super.key});

  @override
  State<RocksType> createState() => _RocksTypeState();
}

class _RocksTypeState extends State<RocksType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Discover',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            onSaved: (value) {},
            style: const TextStyle(color: Colors.white), // Change text color
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              hintText: 'Search "rocks"',
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: AppColors.searchField, // Field background color
              prefixIcon: const Icon(
                Ionicons.search,
                color: Colors.white54,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.searchField, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: AppColors.searchField, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
