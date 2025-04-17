import 'package:flutter/material.dart';
import 'package:nstudio/src/design/constants/studio_colors.dart';
import 'package:nstudio/src/home/data/models/home_section_type.dart';
import 'package:nstudio/src/home/components/home_about_section.dart';
import 'package:nstudio/src/home/components/home_app_bar.dart';
import 'package:nstudio/src/home/components/home_contact_section.dart';
import 'package:nstudio/src/home/components/home_hero_section.dart';
import 'package:nstudio/src/home/components/home_products_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenV2 extends StatefulWidget {
  const HomeScreenV2({super.key});

  @override
  State<HomeScreenV2> createState() => _HomeScreenV2State();
}

class _HomeScreenV2State extends State<HomeScreenV2> {
  final GlobalKey _heroSectionKey = GlobalKey();
  final GlobalKey _productsSectionKey = GlobalKey();
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  void _scrollToSection(HomeSectionType section) async {
    final GlobalKey keyToUse;
    switch (section) {
      case HomeSectionType.home:
        keyToUse = _heroSectionKey;
        break;
      case HomeSectionType.products:
        keyToUse = _productsSectionKey;
        break;
      case HomeSectionType.aboutUs:
        keyToUse = _aboutSectionKey;
        break;
      case HomeSectionType.contact:
        keyToUse = _contactSectionKey;
        break;
    }
    final context = keyToUse.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      // Do Something
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StudioColors.background,
      appBar: HomeAppBarV2(
        onSectionSelected: (newSection) {
          _scrollToSection(newSection);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeroSectionV2(
              key: _heroSectionKey,
              onShopNow: () {
                _scrollToSection(HomeSectionType.products);
              },
              onLearnMore: () {
                _scrollToSection(HomeSectionType.aboutUs);
              },
            ),
            HomeProductsSectionV2(
              key: _productsSectionKey,
            ),
            HomeAboutSectionV2(
              key: _aboutSectionKey,
            ),
            HomeContactSectionV2(
              key: _contactSectionKey,
              onInstagramClicked: () {
                _launchURL('https://instagram.com/nandiini_jain');
              },
              onPhoneClicked: () {
                _launchURL('https://api.whatsapp.com/send?phone=8237636728');
              },
              onEmailClicked: () {
                _launchURL(
                    'mailto:studio.n.circle@gmail.com?subject=ORDER&body=I really linked your product and wanted to get something customised for myself');
              },
            ),
          ],
        ),
      ),
    );
  }
}
