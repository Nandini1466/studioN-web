import 'package:nstudio/src/design/constants/studio_images.dart';
import 'package:nstudio/src/home/data/models/home_product_item.dart';
import 'package:nstudio/src/home/data/models/home_product_type.dart';

class HomeProductsRepository {
  const HomeProductsRepository._();

  static List<HomeProductItem> fetchProducts({HomeProductType? type}) {
    if (type == null) {
      return _fetchProducts();
    } else {
      return _fetchProducts().where((product) => product.type == type).toList();
    }
  }

  static List<HomeProductItem> _fetchProducts() {
    return List.unmodifiable(
      [
        HomeProductItem(
          name: 'Baby Collage',
          assetPathList: [StudioImages.productBabyCollage].unmodifiable(),
          type: HomeProductType.photoCollage,
          isFeatured: true,
        ),
        HomeProductItem(
          name: 'Family Collage',
          assetPathList: [
            StudioImages.productFamilyCollage1,
            StudioImages.productFamilyCollage2,
            StudioImages.productFamilyCollage3,
          ].unmodifiable(),
          isFeatured: true,
          type: HomeProductType.photoCollage,
        ),
        HomeProductItem(
          name: 'Hindi Lyrics',
          assetPathList: [StudioImages.productLyricsHindi].unmodifiable(),
          type: HomeProductType.lyricFrames,
          isFeatured: true,
        ),
        HomeProductItem(
          name: 'Hinglish Lyrics',
          assetPathList: [
            StudioImages.productLyricsHinglish1,
            StudioImages.productLyricsHinglish2
          ].unmodifiable(),
          type: HomeProductType.lyricFrames,
        ),
        HomeProductItem(
          name: 'English Lyrics',
          assetPathList: [
            StudioImages.productLyricsEnglish,
          ].unmodifiable(),
          type: HomeProductType.lyricFrames,
        ),
        HomeProductItem(
          name: 'Travel Collage',
          assetPathList: [StudioImages.productTravelCollage].unmodifiable(),
          type: HomeProductType.photoCollage,
        ),
        HomeProductItem(
          name: 'Wall Collage',
          assetPathList: [StudioImages.productWallCollage].unmodifiable(),
          type: HomeProductType.photoCollage,
        ),
        HomeProductItem(
          name: 'Bubble Candle',
          assetPathList: [StudioImages.productBubbleCandle].unmodifiable(),
          type: HomeProductType.scentedCandles,
        ),
        HomeProductItem(
          name: 'Coffee Candle',
          assetPathList: [
            StudioImages.productCoffeeCandle2,
            StudioImages.productCoffeeCandle1,
          ].unmodifiable(),
          type: HomeProductType.scentedCandles,
        ),
        HomeProductItem(
          name: 'Flower Candle',
          assetPathList: [
            StudioImages.productFlowerCandle1,
            StudioImages.productFlowerCandle2,
          ].unmodifiable(),
          type: HomeProductType.scentedCandles,
        ),
        HomeProductItem(
          name: 'Jar Candle',
          assetPathList: [
            StudioImages.productJarCandle,
          ].unmodifiable(),
          type: HomeProductType.scentedCandles,
        ),
        HomeProductItem(
          name: 'Yarn Candle',
          assetPathList: [
            StudioImages.productYarnCandle,
          ].unmodifiable(),
          type: HomeProductType.scentedCandles,
        ),
      ],
    );
  }
}

extension UnmodifiableIterable<T> on List<T> {
  List<T> unmodifiable() {
    return List.unmodifiable(this);
  }
}
