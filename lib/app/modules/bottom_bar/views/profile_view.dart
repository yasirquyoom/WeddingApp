import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/tabs/event_tab_view.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/tabs/photo_tab_view.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/tabs/video_tab_view.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class ProfileView extends GetView<BottomBarController> {
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtilities.backgroundColor,
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("/settings");
              },
              icon: const Icon(
                Icons.settings,
                color: ColorUtilities.white,
              ))
        ],
        title: Text("Yasir Quymoon",
            style: FontUtilities.h24(
                color: Colors.white, fontFamily: FontFamily.semiBoldInter)),
      ),
      body: GetBuilder<BottomBarController>(builder: (_) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTile(title: "128", subTitle: "Events"),
                  buildTile(title: "100", subTitle: "Photos"),
                  buildTile(title: "180", subTitle: "Videos")
                ],
              ),
            ),
            Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: ColorUtilities.offButtonColor,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: TabBar(
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
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
                      "All Events",
                    ),
                    Text(
                      "All Photos",
                    ),
                    Text(
                      "All Videos",
                    )
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: tabPages,
              ),
            )
          ],
        );
      }),
    );
  }

  List<Widget> tabPages = [
    EventTabView(),
    PhotoTabView(),
    VideoTabView(),
  ];
  Widget buildTile({required String title, required String subTitle}) {
    return Column(
      children: [
        Text(
          title,
          style: FontUtilities.h20(
              color: ColorUtilities.white,
              fontFamily: FontFamily.semiBoldInter),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          subTitle,
          style: FontUtilities.h16(
              color: ColorUtilities.white, fontFamily: FontFamily.mediumInter),
        ),
      ],
    );
  }
}
