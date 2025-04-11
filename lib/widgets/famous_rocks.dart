import 'package:flutter/material.dart';
import 'package:rock_scanner/screens/detail_screen.dart';
import 'package:rock_scanner/widgets/popular_rocks_widget.dart';

import '../theme/light_dark_theme.dart';

class FamousRocks extends StatelessWidget {
  const FamousRocks({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> rocks = [
      'Granite',
      'Basalt',
      'Limestone',
      'Sandstone',
      'Slate'
    ];
    List<String> images = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSkBneftF74PWIra_c8TG3a220XQ-Vmt47ptwU2AU501cXkm3OgQDS19Y&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXLwQJy3PuM3_l1qx9zEiBfDsY_7kQeP2oy9x-cTIz_flK7C9e6xkol08&s',
      'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSVeHtirbQfXXmELOarkr1cghw-TYM0U75o09JKEQZ3WQ2iWjytK07XRqu1deUCdSNyZC-SPl3zO7E0RIS94DCeTT7EURhWWD8o41DE-Hbb',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuF5EMQk85RVgHk_dzFjphSHQBTEftJ9S8EA&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdRsMPBOka3Y2O8Thf028dE9SEUOf055LkfmDjbjB9pATyBj-vR65RxKA&s'
    ];
    return Column(
      children: [
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
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            scrollDirection: Axis.horizontal,
            itemCount: rocks.length,
            itemBuilder: (context, index) {
              return PopularRocks(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          name: rocks[index],
                          image: images[index],
                        ),
                      ),
                    );
                  },
                  name: rocks[index],
                  imagUrl: images[index]);
            },
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
            height: 130,
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
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Experience rocks in your reality space with\n our AR',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
