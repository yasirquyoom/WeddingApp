import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/controllers/event_detail_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class CreatorRequestTab extends GetView<EventDetailController> {
  CreatorRequestTab({Key? key}) : super(key: key);
  EventDetailController eventDetailController =
      Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          if (controller.isShowCheckBox == true) {
            controller.isShowCheckBox = false;
          } else {
            Get.back();
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Content that users will share will see every where when you approve that.",
                style: FontUtilities.h18(
                  color: ColorUtilities.white,
                  fontFamily: FontFamily.semiBoldInter,
                ),
              ),
              SizedBox(
                height: Get.width * 0.01,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Harris Jordon (user )",
                  style: FontUtilities.h14(
                    color: ColorUtilities.white,
                    fontFamily: FontFamily.semiBoldInter,
                  ),
                ),
                subtitle: Text(
                  "Wants to share these movements",
                  style: FontUtilities.h14(
                    color: ColorUtilities.offWhite,
                    fontFamily: FontFamily.regularInter,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: ColorUtilities.white,
                  radius: Get.width * 0.06,
                  child: Image.asset(
                    "assets/img/profile_picture.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: Get.width * 0.01,
              ),
              Text(
                "Select the photos that you want to approve",
                style: FontUtilities.h18(
                  color: ColorUtilities.white,
                  fontFamily: FontFamily.regularInter,
                ),
              ),
              controller.isShowCheckBox == true
                  ? SizedBox(
                      height: Get.width * 0.05,
                    )
                  : SizedBox(),
              controller.isShowCheckBox == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select all",
                          style: FontUtilities.h20(
                            color: ColorUtilities.grayColor,
                            fontFamily: FontFamily.regularInter,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.selectAllCheckbox == true) {
                              controller.selectAllCheckbox = false;
                              for (int i = 0;
                                  i < controller.selectCheckBox.length;
                                  i++) {
                                controller.selectCheckBox[i] = false;
                                log('==================$i');
                              }
                            } else {
                              controller.selectAllCheckbox = true;
                              for (int i = 0;
                                  i < controller.selectCheckBox.length;
                                  i++) {
                                controller.selectCheckBox[i] = true;
                                log('==================$i');
                              }
                            }
                            controller.isSelect = !controller.isSelect;
                            log("===========${controller.selectCheckBox}");
                          },
                          child: Container(
                            height: Get.width * 0.07,
                            width: Get.width * 0.07,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorUtilities.goldenColor,
                              ),
                            ),
                            child: Center(
                              child: controller.selectAllCheckbox == true
                                  ? Icon(
                                      Icons.check,
                                      color: ColorUtilities.white,
                                      size: 15,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: Get.width * 0.05,
              ),
              GridView.builder(
                itemCount: controller.selectCheckBox.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      controller.isShowCheckBox = true;
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/favourite1.png?alt=media&token=de7aee16-88d7-43f4-90b6-681d88e0b3e5",
                          ),
                        ),
                        Positioned(
                          top: Get.width * 0.16,
                          left: Get.width * 0.16,
                          child: Image.asset("assets/icons/Play Button.png",
                              height: Get.width * 0.12,
                              width: Get.width * 0.12,
                              fit: BoxFit.fill),
                        ),
                        controller.isShowCheckBox == true
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.selectCheckBox[index] ==
                                          true) {
                                        controller.selectCheckBox[index] =
                                            false;
                                        controller.selectAllCheckbox = false;
                                      } else {
                                        controller.selectCheckBox[index] = true;
                                      }
                                      controller.isSelect =
                                          !controller.isSelect;
                                      log("===========${controller.selectCheckBox[index]}");
                                    },
                                    child: Container(
                                      height: Get.width * 0.07,
                                      width: Get.width * 0.07,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorUtilities.white,
                                        ),
                                      ),
                                      child: Center(
                                        child:
                                            controller.selectCheckBox[index] ==
                                                    true
                                                ? Icon(
                                                    Icons.check,
                                                    color: ColorUtilities.white,
                                                    size: 15,
                                                  )
                                                : SizedBox(),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: Get.width * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: Get.width * 0.12,
                        decoration: BoxDecoration(
                          color: controller.selectCheckBox.contains(true)
                              ? ColorUtilities.goldenColor
                              : ColorUtilities.offButtonColor,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Center(
                          child: Text(
                            "Decline",
                            style: FontUtilities.h14(
                              color: controller.selectCheckBox.contains(true)
                                  ? ColorUtilities.blackColor
                                  : ColorUtilities.grayColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.12,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: Get.width * 0.12,
                        decoration: BoxDecoration(
                          color: controller.selectCheckBox.contains(true)
                              ? ColorUtilities.goldenColor
                              : ColorUtilities.offButtonColor,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Center(
                          child: Text(
                            "Accept",
                            style: FontUtilities.h14(
                              color: controller.selectCheckBox.contains(true)
                                  ? ColorUtilities.blackColor
                                  : ColorUtilities.grayColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
