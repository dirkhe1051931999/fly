import 'package:flutter/material.dart';
import 'package:fly/item/getx/main.dart';

/// 首页的卡片class

class HomeList {
  HomeList({
    this.imagePath = '',
    this.navigateScreen,
  });

  String imagePath;
  Widget? navigateScreen;
  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/home_grid_thumbnail/getx.png',
      navigateScreen: const GetxView(),
    ),
  ];
}
