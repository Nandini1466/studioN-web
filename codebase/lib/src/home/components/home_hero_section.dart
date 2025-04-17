import 'package:flutter/material.dart';
import 'package:nstudio/src/design/components/image_watermark.dart';
import 'package:nstudio/src/design/constants/studio_colors.dart';
import 'package:nstudio/src/design/constants/studio_images.dart';
import 'package:nstudio/src/design/constants/studio_size.dart';
import 'package:nstudio/src/design/utils/device_utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeHeroSectionV2 extends StatelessWidget {
  final VoidCallback onShopNow;
  final VoidCallback onLearnMore;

  const HomeHeroSectionV2({
    super.key,
    required this.onShopNow,
    required this.onLearnMore,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      columnSpacing: 32,
      rowPadding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 100,
      ),
      columnPadding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 40,
      ),
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: _HeroSectionText(
            onShopNow: onShopNow,
            onLearnMore: onLearnMore,
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(StudioSize.imageBorderRadius),
            child: ImageWatermark(
              assetName: StudioImages.productAllCandles,
              aspectRatio:
                  ResponsiveBreakpoints.of(context).isMobile ? 1.0 : 1.3,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroSectionText extends StatelessWidget {
  final VoidCallback onShopNow;
  final VoidCallback onLearnMore;

  const _HeroSectionText({
    required this.onShopNow,
    required this.onLearnMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Handcrafted\nMemories",
          style: TextStyle(
            fontSize: DeviceUtils.getResponsiveValue(
              context,
              mobileValue: 36,
              tabletValue: 48,
              desktopValue: 64,
            ),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "Framed with Love",
          style: TextStyle(
            fontSize: DeviceUtils.getResponsiveValue(
              context,
              mobileValue: 36,
              tabletValue: 48,
              desktopValue: 64,
            ),
            fontWeight: FontWeight.bold,
            color: StudioColors.mutedForeground,
          ),
        ),
        MaxWidthBox(
          alignment: Alignment.centerLeft,
          maxWidth: 600,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Beautifully designed photo collages and lyric frames, handmade with care by Maharashtra artisans.",
              style: TextStyle(
                fontSize: 24,
                color: StudioColors.mutedForeground,
              ),
            ),
          ),
        ),
        ResponsiveRowColumn(
          layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          columnSpacing: 16,
          rowSpacing: 16,
          children: [
            ResponsiveRowColumnItem(
              child: SizedBox(
                width: ResponsiveBreakpoints.of(context).isMobile
                    ? double.infinity
                    : null,
                child: FilledButton(
                  onPressed: onShopNow,
                  style: FilledButton.styleFrom(
                    backgroundColor: StudioColors.primary,
                    foregroundColor: StudioColors.primaryForeground,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text("Shop Now"),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: SizedBox(
                width: ResponsiveBreakpoints.of(context).isMobile
                    ? double.infinity
                    : null,
                child: OutlinedButton(
                  onPressed: onLearnMore,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: StudioColors.border,
                      width: 2,
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text("Learn More"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
