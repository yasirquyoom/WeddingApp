import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/views/about_event_tab_view.dart';
import 'package:wedding_app/app/modules/event_detail/views/shared_tab/event_creator/shared_tab_view.dart';
import 'package:wedding_app/app/modules/event_detail/views/shared_tab/photographer/photographer_shared_tab.dart';
import 'package:wedding_app/app/modules/event_detail/views/shared_tab/user/user_shared_tab.dart';
import 'package:wedding_app/app/modules/event_detail/views/you_shared_tab_view.dart';
import 'package:wedding_app/main.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

import '../../../../utilities/widget/custom_app_bar.dart';
import '../controllers/event_detail_controller.dart';
import '../../ai_view/views/ai_tab_view.dart';
import 'liked_tab_view.dart';

class EventDetailView extends GetView<EventDetailController> {
  EventDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorUtilities.backgroundColor,
          appBar: customAppBar(
            isIcon: true,
            title: "About Event",
          ),
          body: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
                controller: controller.tabController,
                indicatorColor: ColorUtilities.goldenColor,
                labelColor: ColorUtilities.goldenColor,
                unselectedLabelColor: ColorUtilities.white,
                tabs: const [
                  Text(
                    "Shared",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.mediumInter,
                    ),
                  ),
                  Text(
                    "You Shared",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.mediumInter,
                    ),
                  ),
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.mediumInter,
                    ),
                  ),
                  Text(
                    "Favourites",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.mediumInter,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: tabPages,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> tabPages = [
    userCode == 0
        ? UserShardTab()
        : userCode == 1
            ? PhotographerShardTab()
            : SharedTabView(),
    YouSharedTabView(),
    AboutEventTabView(),
    LikedTabView(),
  ];
}
