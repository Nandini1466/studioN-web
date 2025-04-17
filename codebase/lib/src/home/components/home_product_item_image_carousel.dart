import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nstudio/src/design/components/image_watermark.dart';
import 'package:nstudio/src/design/constants/studio_opacity_alpha_constants.dart';

class HomeProductItemImageCarousel extends StatefulWidget {
  final List<String> assetsName;

  const HomeProductItemImageCarousel({
    super.key,
    required this.assetsName,
  });

  @override
  State<HomeProductItemImageCarousel> createState() =>
      _HomeProductItemImageCarouselState();
}

class _HomeProductItemImageCarouselState
    extends State<HomeProductItemImageCarousel> {
  int _currentImagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 1,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImagePosition = index;
                });
              }),
          items: widget.assetsName.map((assetName) {
            return Builder(
              builder: (BuildContext context) {
                return ImageWatermark(
                  assetName: assetName,
                );
              },
            );
          }).toList(),
        ),
        (widget.assetsName.length > 1)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.assetsName.indexed.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.only(
                      top: 8.0,
                      left: 6.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withAlpha(
                        _currentImagePosition == entry.$1
                            ? StudioOpacityAlphaConstants.opacityPointNine
                            : StudioOpacityAlphaConstants.opacityPointFour,
                      ),
                    ),
                  );
                }).toList(),
              )
            : const SizedBox(
                height: 16,
              ),

        // Stack(
        //   children: [
        //     ImageWatermark(
        //       assetName: widget.productItem.assetName,
        //       aspectRatio: 1,
        //     ),
        //     if (_isHovered) Positioned.fill(child: HomeProductItemHoveredState()),
        //   ],
        // ),
      ],
    );
  }
}
