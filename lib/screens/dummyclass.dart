import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rock_scanner/screens/rocks_type.dart';
import 'package:rock_scanner/widgets/famous_rocks.dart';

import '../theme/light_dark_theme.dart';
import '../widgets/horizontal_listView.dart';

class Dummyclass extends StatefulWidget {
  const Dummyclass({super.key});

  @override
  State<Dummyclass> createState() => _DummyclassState();
}

class _DummyclassState extends State<Dummyclass> {
  int selectedIndex = 0;
  late int? selectedIndex_color;
  final List<Widget> _pages = [
    FamousRocks(),
    RocksType(),
  ];

  void updatePage(int index) {
    setState(() {
      selectedIndex = index; // ✅ Updates the displayed page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Discover',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) {},
                style:
                    const TextStyle(color: Colors.white), // Change text color
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
                    borderSide: const BorderSide(
                        color: AppColors.searchField, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: AppColors.searchField, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HorizontalListview(
                        Name: 'Sedimentary',
                        isSelected: selectedIndex == 0,
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                          updatePage(1);
                        }),
                    HorizontalListview(
                        Name: 'Metamorphic',
                        isSelected: selectedIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                          updatePage(1);
                        }),
                    HorizontalListview(
                        Name: 'Igneous',
                        isSelected: selectedIndex == 2,
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                          updatePage(1);
                        }),
                    HorizontalListview(
                        Name: 'Mineral',
                        isSelected: selectedIndex == 3,
                        onTap: () {
                          setState(() {
                            selectedIndex = 3;
                          });
                          updatePage(1);
                        }),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _pages[selectedIndex],
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
