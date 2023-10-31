import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/allevent_view.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/create_event_view.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/favourites_view.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/profile_view.dart';
import 'package:wedding_app/utilities/color_utilities.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  BottomBarView({Key? key}) : super(key: key);

  List<Widget> screenList = [
    AllEventView(),
    FavouritesView(),
    CreateEventView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      body: GetBuilder<BottomBarController>(
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.selectedPageIndex != 0) {
                controller.selectedPageIndex = 0;
              }
              return false;
            },
            child: screenList[controller.selectedPageIndex],
          );
        },
      ),
      bottomNavigationBar: GetBuilder<BottomBarController>(
        builder: (_) {
          return SafeArea(
            child: Container(
              color: ColorUtilities.backgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: controller.bottomBarData
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          controller.updateIndex(currentIndex: e.index);
                        },
                        child: e.index == 3
                            ? Stack(
                                children: [
                                  Image.asset(
                                    e.imagePath,
                                    width: Get.width * 0.08,
                                    height: Get.width * 0.08,
                                    color: e.isSelected
                                        ? ColorUtilities.goldenColor
                                        : Color(0xff706F6C),
                                  ),
                                  Positioned(
                                    top: Get.width * 0.007,
                                    left: Get.width * 0.007,
                                    child: CircleAvatar(
                                      radius: Get.width * 0.033,
                                      backgroundImage: NetworkImage(
                                        "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/dummy_profile.png?alt=media&token=f8d3381c-573e-4d8b-9047-e079b20f33ce",
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Image.asset(
                                e.imagePath,
                                width: Get.width * 0.08,
                                height: Get.width * 0.08,
                                color: e.isSelected
                                    ? ColorUtilities.goldenColor
                                    : Color(0xff706F6C),
                              ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
