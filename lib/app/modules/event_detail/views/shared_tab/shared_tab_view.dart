import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/views/shared_tab/all_files.dart';
import 'package:wedding_app/app/modules/event_detail/views/shared_tab/request_files.dart';
import '../../../../../utilities/color_utilities.dart';
import '../../../../../utilities/font_utilities.dart';
import '../../controllers/event_detail_controller.dart';

class SharedTabView extends GetView<EventDetailController>{
  SharedTabView({Key? key}) : super(key: key);
  EventDetailController eventDetailController=Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
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
                      borderRadius: BorderRadius.circular(50),
                      color: ColorUtilities.goldenColor),
                  unselectedLabelColor: ColorUtilities.offWhite,
                  labelColor: ColorUtilities.backgroundColor,
                  labelStyle: FontUtilities.h14(),
                  unselectedLabelStyle: FontUtilities.h14(),
                  onTap: (int tabIndex) {
                    controller.selectedTab = tabIndex;
                  },
                  tabs: [
                    Text(
                      "All files",
                    ),
                    Text(
                      "Requested",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.width*0.05,
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
      }
    );
  }

  List<Widget> tabPages = [
    AllFilesView(),
    RequestTabView(),
  ];

}
