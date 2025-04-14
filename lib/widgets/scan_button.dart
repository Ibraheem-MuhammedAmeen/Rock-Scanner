import 'package:flutter/material.dart';

import '../theme/const.dart';
import '../theme/light_dark_theme.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  final Function()? onTap;
  final dynamic icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.IconBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
            ),
            Text(
              '$label',
              style: fontFam,
            ),
          ],
        ),
      ),
    );
  }
}
