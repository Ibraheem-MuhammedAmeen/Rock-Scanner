import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';
import 'package:rock_scanner/widgets/popular_rocks_widget.dart';
import '../service/gemini_service.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  String geminiResponse = "Fetching response..."; // Initial state

  @override
  void initState() {
    super.initState();
    fetchGeminiResponse(); // Fetch response when screen loads
  }

  // Fetch response from Gemini API
  Future<void> fetchGeminiResponse() async {
    GeminiService gemini = GeminiService();
    try {
      String response =
          await gemini.generateText('types of rocks dont explain ');
      setState(() {
        geminiResponse = response; // Update UI
      });
    } catch (e) {
      setState(() {
        geminiResponse = "Error fetching response";
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Discover',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                height: 60, // Set height to prevent ListView issues
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    /*HorizontalListview(Name: 'Sedimentary'),
                    HorizontalListview(Name: 'Metamorphic'),
                    HorizontalListview(Name: 'Igneous'),
                    HorizontalListview(Name: 'Mineral'),*/
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Popular Rocks',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PopularRocks(
                      onTap: () {},
                      name: 'Granite',
                      imagUrl: 'assets/images/granite.png',
                    ),
                    const SizedBox(width: 20),
                    PopularRocks(
                      onTap: () {},
                      name: 'Basalt',
                      imagUrl: 'assets/images/basalt.png',
                    ),
                    const SizedBox(width: 20),
                    PopularRocks(
                      onTap: () {},
                      name: 'Limestone',
                      imagUrl: 'assets/images/limeStone.png',
                    ),
                    const SizedBox(width: 20),
                    PopularRocks(
                      onTap: () {},
                      name: 'Sandstone',
                      imagUrl: 'assets/images/sandStone.png',
                    ),
                    const SizedBox(width: 20),
                    PopularRocks(
                      onTap: () {},
                      name: 'Slate',
                      imagUrl: 'assets/images/slate.png',
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'AR',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.IconBackground,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(16),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rock 3D',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        'Experience rocks in your reality space with \n our AR',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              )

              /*Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  geminiResponse,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
