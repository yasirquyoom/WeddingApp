import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utilities/color_utilities.dart';
import '../../../../utilities/font_utilities.dart';
import '../controllers/event_detail_controller.dart';

class SelectDeleteView extends GetView<EventDetailController> {
  bool deleteIcons;
  SelectDeleteView({Key? key, this.deleteIcons = true}) : super(key: key);
  EventDetailController eventDetailController =
      Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorUtilities.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.clear,
                          color: ColorUtilities.white,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Text(
                        "Photos selected",
                        style: FontUtilities.h20(
                          color: ColorUtilities.white,
                          fontFamily: FontFamily.semiBoldInter,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${controller.selectCheckBox.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + (element == true ? 1 : 0),
                        )}",
                        style: FontUtilities.h20(
                          color: ColorUtilities.white,
                          fontFamily: FontFamily.semiBoldInter,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.07,
                  ),
                  Row(
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
                            borderRadius: BorderRadius.circular(5),
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
                  ),
                  SizedBox(
                    height: Get.width * 0.04,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: controller.selectCheckBox.length,
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
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
                                child: Image.asset(
                                    "assets/icons/Play Button.png",
                                    height: Get.width * 0.12,
                                    width: Get.width * 0.12,
                                    fit: BoxFit.fill),
                              ),
                              Align(
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
                                        borderRadius: BorderRadius.circular(5),
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  Row(
                    children: [
                      deleteIcons
                          ? GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  isScrollControlled: true,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Container(
                                      height: Get.width * 0.4,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: ColorUtilities.offButtonColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Get.width * 0.1),
                                              child: Text(
                                                " Are you sure you want to delete ${controller.selectCheckBox.fold(
                                                  0,
                                                  (previousValue, element) =>
                                                      previousValue +
                                                      (element == true ? 1 : 0),
                                                )} photos",
                                                textAlign: TextAlign.center,
                                                style: FontUtilities.h16(
                                                  color: ColorUtilities.white,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                        color: ColorUtilities
                                                            .blackColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(23),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Cancel",
                                                          style:
                                                              FontUtilities.h16(
                                                            color:
                                                                ColorUtilities
                                                                    .white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.06,
                                                ),
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                        color: ColorUtilities
                                                            .goldenColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(23),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Delete",
                                                          style:
                                                              FontUtilities.h16(
                                                            color:
                                                                ColorUtilities
                                                                    .blackColor,
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
                                    ),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: ColorUtilities.offButtonColor,
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: ColorUtilities.goldenColor,
                                ),
                              ),
                            )
                          : SizedBox(),
                      deleteIcons
                          ? SizedBox(
                              width: Get.width * 0.05,
                            )
                          : SizedBox(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: Get.width * 0.12,
                            decoration: BoxDecoration(
                              color: ColorUtilities.offButtonColor,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Center(
                              child: Text(
                                "Download",
                                style: FontUtilities.h14(
                                  color: ColorUtilities.goldenColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: Get.width * 0.12,
                            decoration: BoxDecoration(
                              color: ColorUtilities.offButtonColor,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Center(
                              child: Text(
                                "Remove",
                                style: FontUtilities.h14(
                                  color: ColorUtilities.goldenColor,
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
          ),
        );
      },
    );
  }
}
