import 'package:flutter/material.dart';

class StudioTabbar extends StatelessWidget {
  final double? width;
  final TabController _tabController;
  final List<Tab> tabs;
  const StudioTabbar(
    this._tabController, {
    required this.tabs,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TabBar(
        indicatorPadding: EdgeInsets.all(6),
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 16),
        tabs: tabs,
      ),
    );
  }
}
