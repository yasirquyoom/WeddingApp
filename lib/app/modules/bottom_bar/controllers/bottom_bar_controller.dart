import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/bottom_bar/model/bottom_bar_data_model.dart';
import 'package:wedding_app/utilities/asset_icons.dart';

class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);

    super.onInit();
    tabController.addListener(() {
      selectedTab = tabController.index;
    });
  }

  List<TabBarModel> tabBarData = [
    TabBarModel(name: "All Events", index: 0),
    TabBarModel(name: "All Photos ", index: 1),
    TabBarModel(name: "All Videos", index: 2),
  ];
  List<BottomBarDataModel> bottomBarData = [
    BottomBarDataModel(imagePath: AssetIcons.icon1, index: 0, isSelected: true),
    BottomBarDataModel(
        imagePath: AssetIcons.icon2, index: 1, isSelected: false),
    BottomBarDataModel(
        imagePath: AssetIcons.icon3, index: 2, isSelected: false),
    BottomBarDataModel(
        imagePath: "assets/icons/settings/Group 5.png",
        index: 3,
        isSelected: false),
  ];
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  set selectedPageIndex(int value) {
    _selectedPageIndex = value;
    update();
  }

  updateIndex({required int currentIndex}) {
    int a = bottomBarData.indexWhere((element) => element.isSelected == true);
    bottomBarData[a].isSelected = false;
    bottomBarData[currentIndex].isSelected = true;
    selectedPageIndex = currentIndex;
    update();
  }

  // late QRViewController controller;
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // void onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen(
  //     (scanData) {},
  //   );
  // }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    update();
  }

  late TabController tabController;
}
