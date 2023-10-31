import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import '../controllers/ai_view_controller.dart';

class UploadPhoto extends GetView<AiViewController> {
  UploadPhoto({Key? key}) : super(key: key);
  AiViewController eventDetailController = Get.put(AiViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiViewController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.width * 0.06,
                ),
                Text(
                  "Upload your selfie or image",
                  style: FontUtilities.h18(
                    color: ColorUtilities.white,
                    fontFamily: FontFamily.semiBoldInter,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    "So that i can help you to find that image that you are looking for.",
                    textAlign: TextAlign.center,
                    style: FontUtilities.h16(
                      color: ColorUtilities.grayColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.10,
                ),
                Stack(
                  children: [
                    Container(
                      height: Get.width * 0.72,
                      width: Get.width,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: ColorUtilities.offButtonColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: controller.imagePath == null
                          ? Center(
                              child: Image.asset(
                                "assets/img/profile_picture.png",
                                height: Get.width * 0.3,
                                width: Get.width,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Stack(
                                children: [
                                  Image.file(
                                    File(controller.imagePath ?? ""),
                                    fit: BoxFit.fill,
                                    height: Get.width * 0.72,
                                    width: Get.width,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.imagePath = null;
                                        },
                                        child: Container(
                                          width: Get.width * 0.12,
                                          height: Get.width * 0.12,
                                          decoration: BoxDecoration(
                                            color: ColorUtilities.offBlack
                                                .withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.close,
                                              size: Get.width * 0.06,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: (((Get.width - 40) / 2) - Get.width * 0.15),
                      child: GestureDetector(
                        onTap: () {
                          if (controller.imagePath == null) {
                            controller.getImage();
                          }
                        },
                        child: Container(
                          height: Get.width * 0.12,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: controller.imagePath != null
                                ? ColorUtilities.goldenColor
                                : ColorUtilities.opeCityWhite,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Center(
                            child: Text(
                              controller.imagePath != null
                                  ? "Confirm"
                                  : "Upload",
                              style: FontUtilities.h16(
                                color: controller.imagePath != null
                                    ? ColorUtilities.blackColor
                                    : ColorUtilities.backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.width * 0.08,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
