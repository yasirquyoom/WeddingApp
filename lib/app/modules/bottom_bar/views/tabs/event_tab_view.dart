import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:wedding_app/utilities/asset_icons.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

import '../../../edit_crate_event/views/event_setting_view.dart';

class EventTabView extends StatelessWidget {
  const EventTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: buildRecentEventBanner(
            radius: 23,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event2.png?alt=media&token=c5c42396-f27a-4a77-8466-082528dc7c2c",
            width: Get.width - 30,
            height: ((Get.width - 30) * 0.71),
          ),
        );
      },
    );
  }

  Widget buildRecentEventBanner(
      {required double height,
      required double width,
      double? radius,
      BoxFit? fit,
      required String imageUrl}) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.network(
              imageUrl,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: height - 50),
            width: width,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff070A10).withOpacity(0),
                Color(0xff070A10).withOpacity(0.6),
                Color(0xff070A10).withOpacity(1),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "John and Julia Wedding",
                  style: FontUtilities.h16(
                      color: ColorUtilities.white,
                      fontFamily: FontFamily.semiBoldInter),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: ColorUtilities.goldenColor,
                    ),
                    Text(" 1300 Media files ",
                        style: FontUtilities.h12(
                            color: ColorUtilities.white,
                            fontFamily: FontFamily.regularInter)),
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: ColorUtilities.goldenColor,
                    ),
                    Text(" 15 Aug 2023",
                        style: FontUtilities.h12(
                            color: ColorUtilities.white,
                            fontFamily: FontFamily.regularInter)),
                  ],
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/add-users");
                },
                child: GlassmorphicContainer(
                  width: Get.width * 0.13,
                  height: Get.width * 0.13,
                  borderRadius: 10,
                  linearGradient: LinearGradient(
                    colors: [
                      ColorUtilities.offButtonColor.withOpacity(0.4),
                      ColorUtilities.offButtonColor.withOpacity(0.7),
                    ],
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      ColorUtilities.offButtonColor.withOpacity(0.4),
                      ColorUtilities.offButtonColor.withOpacity(0.7),
                    ],
                  ),
                  border: 0,
                  blur: 3,
                  child: Center(
                    child: Image.asset(AssetIcons.addProfile,
                        height: Get.width * 0.06, width: Get.width * 0.06),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/edit-crate-event");
                },
                child: GlassmorphicContainer(
                  width: Get.width * 0.13,
                  height: Get.width * 0.13,
                  borderRadius: 10,
                  linearGradient: LinearGradient(
                    colors: [
                      ColorUtilities.offButtonColor.withOpacity(0.4),
                      ColorUtilities.offButtonColor.withOpacity(0.7),
                    ],
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      ColorUtilities.offButtonColor.withOpacity(0.4),
                      ColorUtilities.offButtonColor.withOpacity(0.7),
                    ],
                  ),
                  border: 0,
                  blur: 3,
                  child: Center(
                    child: Image.asset(AssetIcons.editImage,
                        height: Get.width * 0.07, width: Get.width * 0.07),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(()=>EventSettingView());
                },
                child: GlassmorphicContainer(
                  width: Get.width * 0.13,
                  height: Get.width * 0.13,
                  borderRadius: 10,
                  linearGradient: LinearGradient(
                    colors: [
                      ColorUtilities.offButtonColor.withOpacity(0.4),
                      ColorUtilities.offButtonColor.withOpacity(0.7),
                    ],
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      ColorUtilities.offButtonColor.withOpacity(0.4),
                      ColorUtilities.offButtonColor.withOpacity(0.7),
                    ],
                  ),
                  border: 0,
                  blur: 3,
                  child: Center(
                    child: Image.asset(
                      AssetIcons.settingImage,
                      height: Get.width * 0.07,
                      width: Get.width * 0.07,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
