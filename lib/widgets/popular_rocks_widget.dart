import 'package:flutter/material.dart';

import '../theme/light_dark_theme.dart';

class PopularRocks extends StatelessWidget {
  const PopularRocks({
    super.key,
    required this.onTap,
    required this.name,
    required this.imagUrl,
  });

  final String name;
  final void Function()? onTap;
  final String imagUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 155, // Ensure each container has a fixed width for consistency
        decoration: BoxDecoration(
          color: AppColors.IconBackground,
          borderRadius: BorderRadius.circular(30), // Corrected border radius
        ),
        padding: EdgeInsets.all(8), // Add padding for spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  50), // Match border radius with container
              child: Image.network(
                imagUrl,
                width: 40, // Set a proper width
                height: 40, // Set a proper height
                fit: BoxFit.cover, // Ensures image fills space
              ),
            ),
            SizedBox(height: 5), // Add spacing
            Text(
              name,
              style: TextStyle(color: Colors.white), // Improve readability
            ),
          ],
        ),
      ),
    );
  }
}
