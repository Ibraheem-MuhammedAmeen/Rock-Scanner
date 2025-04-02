import 'package:flutter/material.dart';
import 'package:rock_scanner/widgets/popular_rocks_widget.dart';

import '../theme/light_dark_theme.dart';

class FamousRocks extends StatelessWidget {
  const FamousRocks({super.key});

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
