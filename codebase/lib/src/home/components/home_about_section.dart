import 'package:flutter/material.dart';
import 'package:nstudio/src/design/components/image_watermark.dart';
import 'package:nstudio/src/design/constants/studio_colors.dart';
import 'package:nstudio/src/design/constants/studio_images.dart';
import 'package:nstudio/src/design/constants/studio_size.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeAboutSectionV2 extends StatelessWidget {
  const HomeAboutSectionV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 32,
      ),
      child: ResponsiveRowColumn(
          layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          columnSpacing: 32,
          rowSpacing: 32,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(StudioSize.imageBorderRadius),
                child: ImageWatermark(
                  assetName: StudioImages.productFrameWithCandle,
                  fit: BoxFit.fitHeight,
                  aspectRatio: 1.3,
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Handmade with Love",
                    style: TextStyle(
                      fontSize:
                          ResponsiveBreakpoints.of(context).isDesktop ? 36 : 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Welcome to our cozy little creative space! We hand-pour 100% natural soy candles and illustrate custom doodle frames that tell your story. Whether you’re lighting up your room or gifting a frame filled with love, every piece is made with care, creativity, and a whole lot of heart.",
                    style: TextStyle(
                      fontSize: 18,
                      color: StudioColors.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
