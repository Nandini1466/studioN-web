import 'package:flutter/material.dart';
import 'package:nstudio/src/design/components/studio_tabbar.dart';
import 'package:nstudio/src/design/constants/studio_colors.dart';
import 'package:nstudio/src/home/data/home_products_repository.dart';
import 'package:nstudio/src/home/data/models/home_product_item.dart';
import 'package:nstudio/src/home/data/models/home_product_type.dart';
import 'package:nstudio/src/home/components/home_product_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeProductsSectionV2 extends StatefulWidget {
  const HomeProductsSectionV2({super.key});

  @override
  State<HomeProductsSectionV2> createState() => _HomeProductsSectionV2State();
}

class _HomeProductsSectionV2State extends State<HomeProductsSectionV2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _webTabs = [
    "All Products",
    "Photo Collages",
    "Lyric Frames",
    "Scented Candles"
  ];
  final List<String> _mobileTabs = ["All", "Collages", "Lyrics", "Candles"];

  List<HomeProductItem> _productsList = HomeProductsRepository.fetchProducts();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _webTabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          switch (_tabController.index) {
            case 0:
              _productsList = HomeProductsRepository.fetchProducts();
              break;
            case 1:
              _productsList = HomeProductsRepository.fetchProducts(
                type: HomeProductType.photoCollage,
              );
              break;
            case 2:
              _productsList = HomeProductsRepository.fetchProducts(
                type: HomeProductType.lyricFrames,
              );
              break;
            case 3:
              _productsList = HomeProductsRepository.fetchProducts(
                type: HomeProductType.scentedCandles,
              );
              break;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StudioColors.muted,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 8,
      ),
      child: Column(
        children: [
          Text(
            "Our Products",
            style: TextStyle(
              fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 36 : 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Discover our collection of handcrafted products, designed with care and precision.",
            style: TextStyle(
              fontSize: 18,
              color: StudioColors.mutedForeground,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          MaxWidthBox(
            maxWidth: 650,
            child: StudioTabbar(
              _tabController,
              tabs: ResponsiveBreakpoints.of(context).isDesktop
                  ? _webTabs.map((tab) => Tab(text: tab)).toList()
                  : _mobileTabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),
          SizedBox(height: 32),
          ResponsiveGridView.builder(
            gridDelegate: ResponsiveGridDelegate(
              crossAxisExtent:
                  ResponsiveBreakpoints.of(context).isDesktop ? 390 : 350,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            shrinkWrap: true,
            alignment: Alignment.center,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return HomeProductItemV2(
                productItem: _productsList[index],
              );
            },
            itemCount: _productsList.length,
          ),
        ],
      ),
    );
  }
}
