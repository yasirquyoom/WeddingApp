import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';

class ChangeNumberOtpVerifyView extends GetView<SettingsController> {
  const ChangeNumberOtpVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      body: GetBuilder<SettingsController>(
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Change number",
                            style: FontUtilities.h18(
                              fontFamily: FontFamily.mediumInter,
                              color: ColorUtilities.offWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.3,
                    ),
                    Text(
                      "Verification Code",
                      style: FontUtilities.h26(
                        fontFamily: FontFamily.semiBoldInter,
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    Text(
                      "Please, enter 6 digit verifiction code.",
                      style: FontUtilities.h14(
                        fontFamily: FontFamily.regularInter,
                        color: ColorUtilities.offWhite,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return Container(
                          width: Get.width * 0.135,
                          height: Get.width * 0.135,
                          child: TextField(
                            cursorColor: ColorUtilities.white,
                            focusNode: controller.focusNodes[index],
                            autofocus: true,
                            controller: controller.otpControllers[index],
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: FontUtilities.h16(
                                color: ColorUtilities.offWhite,
                                fontFamily: FontFamily.mediumInter),
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              if (text.length == 1) {
                                int nextField = index + 1;
                                if (nextField < 6) {
                                  controller.fieldFocusChange(
                                    context,
                                    controller.focusNodes[index],
                                    controller.focusNodes[nextField],
                                  );
                                }
                              } else {
                                int prevIndex = index - 1;
                                if (prevIndex >= 0) {
                                  FocusScope.of(context).requestFocus(
                                    controller.fieldFocusChange(
                                      context,
                                      controller.focusNodes[index],
                                      controller.focusNodes[prevIndex],
                                    ),
                                  );
                                }
                              }
                              controller.otpConfirm = controller
                                      .otpControllers[0].text.isNotEmpty &&
                                  controller
                                      .otpControllers[1].text.isNotEmpty &&
                                  controller
                                      .otpControllers[2].text.isNotEmpty &&
                                  controller
                                      .otpControllers[3].text.isNotEmpty &&
                                  controller
                                      .otpControllers[4].text.isNotEmpty &&
                                  controller.otpControllers[5].text.isNotEmpty;
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorUtilities.offWhite
                                        .withOpacity(0.25)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorUtilities.white),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    Text(
                      "Invalid verification code",
                      style: FontUtilities.h14(
                        color: ColorUtilities.red,
                        fontFamily: FontFamily.regularInter,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.3,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: customButton(
                            onTap: () {},
                            isDisable: true,
                            title: "Resend Code",
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: customButton(
                            onTap: () {
                              log('========length=====${controller.otpControllers.last.text.isEmpty}');
                              Get.back();
                            },
                            isDisable: controller.otpConfirm ? false : true,
                            title: "Confirm",
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
      ),
    );
  }
}
