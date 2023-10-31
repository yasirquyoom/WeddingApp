import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/add_users/views/event_code_view.dart';
import 'package:wedding_app/app/modules/add_users/views/super_user.dart';
import 'package:wedding_app/app/modules/add_users/views/user_view.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';

import '../../../../utilities/font_utilities.dart';
import '../controllers/add_users_controller.dart';

class AddUsersView extends GetView<AddUsersController> {
  AddUsersView({Key? key}) : super(key: key);
  AddUsersController addUsersController = Get.put(AddUsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: customAppBar(
        title: "Add Users",
      ),
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
                  borderRadius: BorderRadius.circular(50), // Creates border
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
                  "Event Code",
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Users",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Album Access",
                  ),
                )
              ],
            ),
          ),
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
      ),
    );
  }

  List<Widget> tabPages = [
    EventCodeView(),
    UserView(),
    SuperUserView(),
  ];
}
