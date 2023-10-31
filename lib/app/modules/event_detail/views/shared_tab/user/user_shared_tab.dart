import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/controllers/event_detail_controller.dart';
import 'package:wedding_app/app/modules/event_detail/views/shared_tab/user/all_photos_tab.dart';
import 'package:wedding_app/app/modules/event_detail/views/shared_tab/user/all_video_tab.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class UserShardTab extends GetView<EventDetailController> {
  EventDetailController eventDetailController =
      Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: ColorUtilities.offButtonColor,
                borderRadius: BorderRadius.circular(23),
              ),
              child: TabBar(
                controller: controller.sharedTabController,
                labelPadding: EdgeInsets.zero,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: ColorUtilities.goldenColor),
                unselectedLabelColor: ColorUtilities.offWhite,
                labelColor: ColorUtilities.backgroundColor,
                labelStyle: FontUtilities.h14(),
                unselectedLabelStyle: FontUtilities.h14(),
                onTap: (int tabIndex) {
                  controller.selectedTab = tabIndex;
                },
                tabs: const [
                  Text(
                    "Photos",
                  ),
                  Text(
                    "Videos",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.sharedTabController,
                children: tabPages,
              ),
            )
          ],
        ),
      );
    });
  }

  List<Widget> tabPages = [
    AllPhotoTab(),
    AllVideoTab(),
  ];
}
