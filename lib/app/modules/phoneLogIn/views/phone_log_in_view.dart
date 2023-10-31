import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';

import '../../../../utilities/widget/circular_progress.dart';
import '../controllers/phone_log_in_controller.dart';

class PhoneLogInView extends GetView<PhoneLogInController> {
  const PhoneLogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      body: GetBuilder<PhoneLogInController>(
        builder: (controller) {
          return SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                            // Text(
                            //   "Change number",
                            //   style: FontUtilities.h18(
                            //     fontFamily: FontFamily.mediumInter,
                            //     color: ColorUtilities.offWhite,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 50, top: Get.width * 0.35),
                        child: Text(
                          "Provide your phone number",
                          style: FontUtilities.h26(
                            fontFamily: FontFamily.semiBoldInter,
                            color: ColorUtilities.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.width * 0.07,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: controller.numberLength
                                ? Colors.red
                                : ColorUtilities.offWhite,
                          ),
                        ),
                        child: CountryCodePicker(
                          barrierColor: ColorUtilities.backgroundColor,
                          onChanged: print,
                          initialSelection: 'IN',
                          hideMainText: true,
                          favorite: const ['In', '+91'],
                          builder: (p0) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "${p0!.dialCode}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundImage: AssetImage(
                                          p0.flagUri ?? "",
                                          package: 'country_code_picker',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.05,
                                    ),
                                    Container(
                                      height: Get.height * 0.03,
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            controller.mobileNumberController,
                                        cursorColor: Colors.white,
                                        keyboardType: TextInputType.number,
                                        autofocus: true,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(10),
                                        ],
                                        // readOnly: isBlue ?? false,
                                        onChanged: (value) {
                                          controller.number = value;
                                        },
                                        style: FontUtilities.h14(
                                          color: ColorUtilities.white,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Enter your phone number",
                                          contentPadding: EdgeInsets.only(
                                              left: 20, top: 10, right: 20),
                                          hintStyle: FontUtilities.h14(
                                            fontFamily: FontFamily.mediumInter,
                                            color: ColorUtilities.offWhite,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          onInit: (code) {
                            log("on init ${code?.dialCode}");
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.width * 0.018,
                      ),
                      controller.numberLength
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "* Mobile Number 10 digit is Required",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: Get.width * 0.06,
                      ),
                      GestureDetector(
                        child: customButton(
                          onTap: () async{
                            if (controller.number.length != 10) {
                              controller.numberLength = true;
                            } else if (controller.number.isEmpty) {
                            } else {
                              controller.numberLength = false;
                              await controller.sendOtp(phoneNumber: controller.mobileNumberController.text);
                            }
                          },
                          isDisable:
                              controller.number.length == 10 ? false : true,
                          title: 'Confirm',
                        ),
                      ),
                    ],
                  ),
                ),
                controller.sendOtpLoading == true
                    ? circularProgressIndicator()
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
