import 'package:flutter/material.dart';
import 'package:nstudio/src/design/constants/studio_opacity_alpha_constants.dart';

class HomeProductItemHoveredState extends StatelessWidget {
  const HomeProductItemHoveredState({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(
        StudioOpacityAlphaConstants.opacityPointFive,
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle button click
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                "View Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
