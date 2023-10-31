import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottom_bar/model/bottom_bar_data_model.dart';

class AddUsersController extends GetxController  with GetSingleTickerProviderStateMixin {

  TextEditingController emailController=TextEditingController();

  late TabController tabController;

  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    update();
  }

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

  List album = [
    "Photographer",
    "Admin",
  ];

  String _emailId="";

  String get emailId => _emailId;

  set emailId(String value) {
    _emailId = value;
    update();
  }

  String _selectRole = "Photographer";

  String get selectRole => _selectRole;

  set selectRole(String value) {
    _selectRole = value;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
