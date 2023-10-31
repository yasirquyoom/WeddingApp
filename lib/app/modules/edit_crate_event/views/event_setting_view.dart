import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/edit_crate_event/controllers/edit_crate_event_controller.dart';
import 'package:wedding_app/app/modules/event_detail/controllers/event_detail_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';
import 'package:wedding_app/utilities/widget/custom_textfield.dart';

class EventSettingView extends GetView<EditCrateEventController> {
  EventSettingView({Key? key}) : super(key: key);
  EditCrateEventController editCrateEventController =
      Get.put(EditCrateEventController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCrateEventController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: customButton(
              onTap: () {},
              isDisable: false,
              title: "Upgrade your plan",
            ),
          ),
          backgroundColor: ColorUtilities.backgroundColor,
          appBar: customAppBar(
            title: "Event Settings",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Face-recognition privacy",
                        style: FontUtilities.h16(
                          color: Color(0xffF4F4F4),
                          fontFamily: FontFamily.regularInter,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.isSwitchButton == false ? "No" : "Yes",
                        style: FontUtilities.h18(
                          color: Color(0xffF4F4F4),
                        ),
                      ),
                      CupertinoSwitch(
                        thumbColor: ColorUtilities.offWhite,
                        trackColor: ColorUtilities.offButtonColor,
                        activeColor: ColorUtilities.goldenColor,
                        value: controller.isSwitchButton,
                        onChanged: (value) {
                          controller.isSwitchButton = value;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.02,
                  ),
                  Text(
                    "Guests can view only their photos by clicking a selfie. No access to other photos",
                    style: FontUtilities.h18(
                      color: ColorUtilities.offWhite,
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Guests uploads",
                        style: FontUtilities.h16(
                          color: Color(0xffF4F4F4),
                          fontFamily: FontFamily.regularInter,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.isGuestButton == false ? "No" : "Yes",
                        style: FontUtilities.h18(
                          color: Color(0xffF4F4F4),
                        ),
                      ),
                      CupertinoSwitch(
                        thumbColor: ColorUtilities.offWhite,
                        trackColor: ColorUtilities.offButtonColor,
                        activeColor: ColorUtilities.goldenColor,
                        value: controller.isGuestButton,
                        onChanged: (value) {
                          controller.isGuestButton = value;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.02,
                  ),
                  Text(
                    "Allow guests to upload photos",
                    style: FontUtilities.h18(
                      color: ColorUtilities.offWhite,
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  ListView.builder(
                    itemCount: controller.wedding.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          index == 2
                              ? SizedBox()
                              : Text(
                                  index == 0
                                      ? "Current storage plan"
                                      : "Topup storage",
                                  style: FontUtilities.h20(
                                    color: ColorUtilities.goldenColor,
                                    fontFamily: FontFamily.semiBoldInter,
                                  ),
                                ),
                          SizedBox(
                            height: Get.width * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectStorage = index;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Container(
                                height: Get.width * 0.25,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: ColorUtilities.goldenColor,
                                      width: 1),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      ColorUtilities.blackColor,
                                      ColorUtilities.offButtonColor,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: Get.width * 0.07,
                                      width: Get.width * 0.24,
                                      decoration: BoxDecoration(
                                        color: ColorUtilities.goldenColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${controller.wedding[index]['title']}",
                                          style: FontUtilities.h14(
                                            color: ColorUtilities
                                                .opeCityBlackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text:
                                                    "${controller.wedding[index]['storage']} GB ",
                                                style: FontUtilities.h16(
                                                  color: ColorUtilities.white,
                                                  fontFamily:
                                                      FontFamily.semiBoldInter,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "Storage",
                                                    style: FontUtilities.h14(
                                                      color:
                                                          ColorUtilities.white,
                                                      fontFamily: FontFamily
                                                          .mediumInter,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                                  "${controller.wedding[index]['price']}/",
                                              style: FontUtilities.h14(
                                                color:
                                                    ColorUtilities.goldenColor,
                                                fontFamily:
                                                    FontFamily.mediumInter,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "year",
                                                  style: FontUtilities.h14(
                                                    color: ColorUtilities.white,
                                                    fontFamily:
                                                        FontFamily.mediumInter,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: Get.width * 0.08,
                                            width: Get.width * 0.08,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color:
                                                    ColorUtilities.goldenColor,
                                              ),
                                            ),
                                            child: controller.selectStorage ==
                                                    index
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          ColorUtilities
                                                              .goldenColor,
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // SizedBox(
                  //   height: Get.width * 0.03,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Text(
                  //     "Referral ID ( Optional )",
                  //     style: FontUtilities.h16(
                  //       color: ColorUtilities.white,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: Get.width * 0.03,
                  // ),
                  // CustomTextField(
                  //   textEditingController: controller.referralCodeController,
                  //   hintText: "E.g 4682ecc2f",
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
