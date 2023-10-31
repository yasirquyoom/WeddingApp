import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TabSelected {
  bool secondTabSelected;
  TabSelected({required this.secondTabSelected});
}

class AiViewController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement AiViewController
  TabSelected arg = Get.arguments as TabSelected;

  late TabController tabController;

  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    tabController = TabController(
        length: 2, vsync: this, initialIndex: arg.secondTabSelected ? 1 : 0);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? _imagePath;

  String? get imagePath => _imagePath;

  set imagePath(String? value) {
    _imagePath = value;
    update();
  }

  List _media = [];

  List get media => _media;

  set media(List value) {
    _media = value;
    update();
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imagePath = image?.path;
    media.add(image?.path);
    media = media.reversed.toList();
    log('==media.reversed===${media}');
    update();
  }

  void increment() => count.value++;
}
