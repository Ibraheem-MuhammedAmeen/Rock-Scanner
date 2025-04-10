import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rock_scanner/widgets/details/igneous_rock.dart';
import 'package:rock_scanner/widgets/details/matamorphic_rock.dart';
import 'package:rock_scanner/widgets/details/mineral_rock.dart';
import 'package:rock_scanner/widgets/details/sedimentary_rocks.dart';
import 'package:rock_scanner/widgets/famous_rocks.dart';

import '../theme/light_dark_theme.dart';
import '../widgets/horizontal_listView.dart';

class RocksType extends StatefulWidget {
  const RocksType({super.key});

  @override
  State<RocksType> createState() => _RocksTypeState();
}

class _RocksTypeState extends State<RocksType> {
  int selectedIndex = 0;
  bool isPressed1 = false;

  late int? selectedIndex_color;
  final List<Widget> _pages = [
    FamousRocks(),
    SedimentaryRocks(),
    MetamorphicRock(),
    IgneousRock(),
    MineralRock(),
  ];
  List<String> rockTypes = ['Sedimentary', 'Metamorphic', 'Igneous', 'Mineral'];
  List<bool> isPressedList = List.generate(4, (index) => false);

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // Always dispose your controllers, fr fr.
    super.dispose();
  }

  void _onButtonPressed(String rockType) {
    setState(() {
      _controller.text = '$rockType';
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
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
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
                suffixIcon: selectedIndex > 0
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.text = '';
                            selectedIndex = 0;
                            for (int i = 0; i < isPressedList.length; i++) {
                              isPressedList[i] = false;
                            }
                          });
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.white54,
                        ),
                      )
                    : null,

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
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rockTypes.length,
                itemBuilder: (context, index) {
                  return HorizontalListview(
                    Name: rockTypes[index],
                    isPressed: isPressedList[index],
                    onTap: () {
                      _onButtonPressed(rockTypes[index]);
                      setState(() {
                        for (int i = 0; i < isPressedList.length; i++) {
                          isPressedList[i] = false;
                        }
                        isPressedList[index] = true;
                        selectedIndex = index + 1;
                      });
                    },
                  );
                },
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
    );
  }
}
