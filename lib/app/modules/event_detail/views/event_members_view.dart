import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';

import '../../../../utilities/font_utilities.dart';

class EventMembersView extends GetView {
  const EventMembersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: customAppBar(
        title: "Members",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Yasir Quyoom",
                style: FontUtilities.h16(
                  color: ColorUtilities.white,
                  fontFamily: FontFamily.semiBoldInter,
                ),
              ),
              subtitle: Text(
                "user@example.com",
                style: FontUtilities.h16(
                  color: ColorUtilities.offWhite,
                  fontFamily: FontFamily.regularInter,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: ColorUtilities.white,
                radius: Get.width * 0.07,
                child: Image.asset(
                  "assets/img/profile_picture.png",
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
