import 'package:flutter/material.dart';
import 'package:nstudio/src/design/constants/studio_colors.dart';

class HomeProductItemFeatureTag extends StatelessWidget {
  const HomeProductItemFeatureTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: StudioColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Featured",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: StudioColors.primaryForeground,
        ),
      ),
    );
  }
}
