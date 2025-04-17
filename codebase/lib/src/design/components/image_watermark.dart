import 'package:flutter/material.dart';
import 'package:nstudio/src/design/constants/studio_images.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ImageWatermark extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final double? watermarkSize;
  final BoxFit fit;

  const ImageWatermark({
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.aspectRatio,
    this.watermarkSize,
    required this.assetName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        aspectRatio != null
            ? AspectRatio(
                aspectRatio: aspectRatio!,
                child: Image.asset(
                  assetName,
                  fit: fit,
                ),
              )
            : Image.asset(
                assetName,
                fit: fit,
                width: width,
                height: height,
              ),
        Positioned(
          bottom: 8,
          right: 16,
          child: Image.asset(
            StudioImages.studioLogo,
            width: watermarkSize ??
                (ResponsiveBreakpoints.of(context).isMobile ? 30 : 40),
            height: watermarkSize ??
                (ResponsiveBreakpoints.of(context).isMobile ? 30 : 40),
          ),
        ),
      ],
    );
  }
}
