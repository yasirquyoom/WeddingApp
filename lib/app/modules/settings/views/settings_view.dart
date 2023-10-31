import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/settings/views/privacy_view.dart';
import 'package:wedding_app/app/modules/settings/views/rate_view.dart';
import 'package:wedding_app/app/modules/settings/views/report_view.dart';
import 'package:wedding_app/app/modules/settings/views/updateNumber/update_phone_view.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: customAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            buildTile(
                imagePath: controller.settingData[0].imagePath,
                title: controller.settingData[0].name,
                onTap: () {
                  Get.to(UpdatePhoneView());
                }),
            buildTile(
                imagePath: controller.settingData[1].imagePath,
                title: controller.settingData[1].name,
                onTap: () {
                  Get.to(PrivacyView());
                }),
            buildTile(
                imagePath: controller.settingData[2].imagePath,
                title: controller.settingData[2].name,
                onTap: () {
                  Get.to(ReportView());
                }),
            buildTile(
                imagePath: controller.settingData[3].imagePath,
                title: controller.settingData[3].name,
                onTap: () {
                  Get.to(RateView());
                }),
            buildTile(
                imagePath: controller.settingData[4].imagePath,
                title: controller.settingData[4].name,
                onTap: () {}),
            buildTile(
                imagePath: controller.settingData[5].imagePath,
                title: controller.settingData[5].name,
                onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget buildTile(
      {required String imagePath,
      required Function() onTap,
      required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorUtilities.offButtonColor,
                  radius: 30,
                  child: Image.asset(imagePath,
                      height: 25, width: 25, fit: BoxFit.fill),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: FontUtilities.h16(
                      color: ColorUtilities.white,
                      fontFamily: FontFamily.regularInter),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorUtilities.white,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
