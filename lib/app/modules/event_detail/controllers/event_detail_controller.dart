import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EventDetailController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement EventDetailController

  late TabController tabController;
  late TabController sharedTabController;

  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    update();
  }

  List selectCheckBox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];


  bool _selectAllCheckbox=false;

  bool get selectAllCheckbox => _selectAllCheckbox;

  set selectAllCheckbox(bool value) {
    _selectAllCheckbox = value;
    update();
  }

  bool _isSelect = false;

  bool get isSelect => _isSelect;

  set isSelect(bool value) {
    _isSelect = value;
    update();
  }

  bool _isShowCheckBox = false;

  bool get isShowCheckBox => _isShowCheckBox;

  set isShowCheckBox(bool value) {
    _isShowCheckBox = value;
    update();
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

  final count = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    sharedTabController = TabController(length: 2, vsync: this);
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

  void increment() => count.value++;
}
