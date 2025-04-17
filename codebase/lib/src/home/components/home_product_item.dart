import 'package:flutter/material.dart';
import 'package:nstudio/src/design/constants/studio_colors.dart';
import 'package:nstudio/src/design/constants/studio_size.dart';
import 'package:nstudio/src/home/data/models/home_product_item.dart';
import 'package:nstudio/src/home/components/home_product_item_feature_tag.dart';
import 'package:nstudio/src/home/components/home_product_item_image_carousel.dart';

class HomeProductItemV2 extends StatefulWidget {
  final HomeProductItem productItem;

  const HomeProductItemV2({
    super.key,
    required this.productItem,
  });

  @override
  State<HomeProductItemV2> createState() => _HomeProductItemV2State();
}

class _HomeProductItemV2State extends State<HomeProductItemV2> {
  // bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        // setState(() {
        //   _isHovered = true;
        // });
      },
      onExit: (event) {
        // setState(() {
        //   _isHovered = false;
        // });
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(StudioSize.imageBorderRadius),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  HomeProductItemImageCarousel(
                    key: ValueKey(widget.productItem.assetPathList.toString()),
                    assetsName: widget.productItem.assetPathList,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productItem.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.productItem.type.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: StudioColors.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.productItem.isFeatured) HomeProductItemFeatureTag(),
        ],
      ),
    );
  }
}
