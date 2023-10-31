import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';
import 'package:wedding_app/utilities/widget/custom_textfield.dart';

import '../controllers/crate_event_controller.dart';

class PaymentPageView extends GetView<CrateEventController> {
  PaymentPageView({Key? key}) : super(key: key);
  CrateEventController crateEventController = Get.put(CrateEventController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CrateEventController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: customButton(
            onTap: () {},
            isDisable: false,
            title: "Create Event",
          ),
        ),
        backgroundColor: ColorUtilities.backgroundColor,
        appBar: customAppBar(
          title: "Payment Page",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select the storage package for",
                  style: FontUtilities.h16(
                    color: Colors.white,
                    fontFamily: FontFamily.regularInter,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.04,
                ),
                Text(
                  "John and Julia Wedding",
                  style: FontUtilities.h24(
                    color: ColorUtilities.goldenColor,
                    fontFamily: FontFamily.semiBoldInter,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.1,
                ),
                ListView.builder(
                  itemCount: controller.wedding.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
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
                                color: ColorUtilities.goldenColor, width: 1),
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
                                      color: ColorUtilities.opeCityBlackColor,
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
                                                color: ColorUtilities.white,
                                                fontFamily:
                                                    FontFamily.mediumInter,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "${controller.wedding[index]['price']}",
                                        style: FontUtilities.h14(
                                          color: ColorUtilities.white,
                                          fontFamily: FontFamily.mediumInter,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: Get.width * 0.08,
                                      width: Get.width * 0.08,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: ColorUtilities.goldenColor,
                                        ),
                                      ),
                                      child: controller.selectStorage == index
                                          ? Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor:
                                                    ColorUtilities.goldenColor,
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
                    );
                  },
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Referral ID ( Optional )",
                    style: FontUtilities.h16(
                      color: ColorUtilities.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                CustomTextField(
                  textEditingController: controller.referralCodeController,
                  hintText: "E.g 4682ecc2f",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
