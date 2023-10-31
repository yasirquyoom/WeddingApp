import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/ai_view/views/upload_photo.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import '../controllers/ai_view_controller.dart';
import 'ai_albums.dart';

class AiView extends GetView<AiViewController> {
  AiView({Key? key}) : super(key: key);
  AiViewController eventDetailController = Get.put(AiViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiViewController>(
      builder: (controller) {
        return Scaffold(
          appBar: customAppBar(
            title: "Your Photos ( By AI )",
          ),
          backgroundColor: ColorUtilities.backgroundColor,
          body: Column(
            children: [
              Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: ColorUtilities.offButtonColor,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: TabBar(
                  controller: controller.tabController,
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
                      "Upload Photo",
                    ),
                    Text(
                      "Album",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.width * 0.05,
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
    UploadPhoto(),
    AiAlbumView(),
  ];
}
