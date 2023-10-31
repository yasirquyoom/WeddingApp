import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/crate_event/views/payment_page.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';
import 'package:wedding_app/utilities/widget/custom_textfield.dart';

import '../../../../utilities/widget/circular_progress.dart';
import '../controllers/crate_event_controller.dart';

class EventDetailView extends GetView<CrateEventController> {
  String? name;
  String? date;
  String? description;
  String? image;
  EventDetailView(
      {Key? key, this.name, this.description, this.image, this.date})
      : super(key: key);
  CrateEventController crateEventController = Get.put(CrateEventController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CrateEventController>(builder: (controller) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: ColorUtilities.backgroundColor,
            appBar: customAppBar(
              title: "Event management details",
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(18),
              child: customButton(
                onTap: () async {
                  bool vendorIsEmpty = false;
                  controller.vendorList.forEach((element) {
                    if (element[0].text.isEmpty ||
                        element[1].text.isEmpty ||
                        element[2].text.isEmpty ||
                        element[3].text.isEmpty ||
                        element[4].text.isEmpty) {
                      vendorIsEmpty = true;
                    }
                  });
                  if (vendorIsEmpty == true) {
                    Get.showSnackbar(
                      GetSnackBar(
                        message: "Please Enter Venders Detail",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorUtilities.goldenColor,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else if (controller
                          .managementStudioController.text.isEmpty ||
                      controller.managementStudioController.text.isEmpty ||
                      controller.managementStudioController.text.isEmpty ||
                      controller.managementStudioController.text.isEmpty) {
                    Get.showSnackbar(
                      GetSnackBar(
                        message: "Please Enter Management Detail",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorUtilities.goldenColor,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else if (controller.venueController.text.isEmpty ||
                      controller.venueWebsiteController.text.isEmpty ||
                      controller.venueInstagramController.text.isEmpty ||
                      controller.venueNumberController.text.isEmpty) {
                    Get.showSnackbar(
                      GetSnackBar(
                        message: "Please Enter Venue Detail",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorUtilities.goldenColor,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else if (controller.photographController.text.isEmpty ||
                      controller.photographInstagramController.text.isEmpty ||
                      controller
                          .photographMobileNumberController.text.isEmpty) {
                    Get.showSnackbar(
                      GetSnackBar(
                        message: "Please Enter PhotoGraph Detail",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorUtilities.goldenColor,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else if (controller.makeUpController.text.isEmpty ||
                      controller.makeUpInstagramController.text.isEmpty ||
                      controller.makeUpMobileNumberController.text.isEmpty) {
                    Get.showSnackbar(
                      GetSnackBar(
                        message: "Please Enter MakeUp Artist Detail",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorUtilities.goldenColor,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    List a = [];
                    a.addAll({
                      {
                        "category": "Event Management Company",
                        "name": controller.managementStudioController.text,
                        "website": controller.manageWebsiteController.text,
                        "instagram": controller.mangeInstagramController.text,
                        "phoneNumber":
                            controller.mangeMobileNumberController.text,
                      },
                      {
                        "category": "Venue",
                        "name": controller.venueController.text,
                        "website": controller.venueWebsiteController.text,
                        "instagram": controller.venueInstagramController.text,
                        "phoneNumber": controller.venueNumberController.text,
                      },
                      {
                        "category": "Photography Company",
                        "name": controller.photographController.text,
                        "website": "",
                        "instagram":
                            controller.photographInstagramController.text,
                        "phoneNumber":
                            controller.photographMobileNumberController.text,
                      },
                      {
                        "category": "MakeUp Artist",
                        "name": controller.makeUpController.text,
                        "website": "",
                        "instagram": controller.makeUpInstagramController.text,
                        "phoneNumber":
                            controller.makeUpMobileNumberController.text,
                      },
                    });
                    controller.vendorList.forEach((element) {
                      a.add({
                        "category": element[0].text,
                        "name": element[1].text,
                        "website": element[2].text,
                        "instagram": element[3].text,
                        "phoneNumber": element[4].text,
                      });
                    });
                    await controller.createEvent(
                      name: name ?? "",
                      description: description ?? '',
                      date: date ?? "",
                      vendors: a,
                      image: image ?? "",
                    );
                  }
                },
                isDisable: false,
                title: "Continue",
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event mangement company",
                      style: FontUtilities.h18(
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.managementStudioController,
                      hintText: 'E.g Hills Studio',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController: controller.manageWebsiteController,
                      hintText: 'www.domainname.com',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.mangeInstagramController,
                      hintText: 'instagram.com/',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.mangeMobileNumberController,
                      hintText: 'Enter MobileNumber',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    Text(
                      "Venue",
                      style: FontUtilities.h18(
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    CustomTextField(
                      textEditingController: controller.venueController,
                      hintText: 'E.g BookEventz Venues',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController: controller.venueWebsiteController,
                      hintText: 'www.domainname.com',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.venueInstagramController,
                      hintText: 'instagram.com/',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController: controller.venueNumberController,
                      hintText: 'Enter MobileNumber',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    Text(
                      "Photography Company",
                      style: FontUtilities.h18(
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    CustomTextField(
                      textEditingController: controller.photographController,
                      hintText: 'E.g Shivam Arora',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.photographInstagramController,
                      hintText: 'instagram.com/',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.photographMobileNumberController,
                      hintText: 'Enter MobileNumber',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    Text(
                      "Makeup Artist",
                      style: FontUtilities.h18(
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    CustomTextField(
                      textEditingController: controller.makeUpController,
                      hintText: 'E.g Shivam Arora',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.makeUpInstagramController,
                      hintText: 'instagram.com/',
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      textEditingController:
                          controller.makeUpMobileNumberController,
                      hintText: 'Enter MobileNumber',
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.vendorList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildVendorTile(
                            onDeleteTap: () {
                              controller.removeVendorData(index);
                            },
                            mobileNumber: controller.vendorList[index][4],
                            categoryController: controller.vendorList[index][1],
                            domainNameController: controller.vendorList[index]
                                [3],
                            instUrlController: controller.vendorList[index][2],
                            nameController: controller.vendorList[index][0]);
                      },
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add more venders",
                          style: FontUtilities.h18(
                            color: ColorUtilities.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.addVendorData();
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: ColorUtilities.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (controller.isCreateLoading)
            circularProgressIndicator()
        ],
      );
    });
  }

  Widget buildVendorTile(
      {required Function() onDeleteTap,
      required TextEditingController nameController,
      required TextEditingController categoryController,
      required TextEditingController mobileNumber,
      required TextEditingController instUrlController,
      required TextEditingController domainNameController}) {
    return Column(
      children: [
        SizedBox(
          height: Get.width * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Venders details",
              style: FontUtilities.h18(
                color: ColorUtilities.white,
              ),
            ),
            GestureDetector(
              onTap: onDeleteTap,
              child: Transform.rotate(
                angle: -pi / 4,
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: ColorUtilities.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.05,
        ),
        CustomTextField(
          textEditingController: nameController,
          hintText: 'E.g Shivam Arora',
        ),
        SizedBox(
          height: Get.width * 0.03,
        ),
        CustomTextField(
          textEditingController: categoryController,
          hintText: 'E.g Catering',
        ),
        SizedBox(
          height: Get.width * 0.03,
        ),
        CustomTextField(
          textEditingController: instUrlController,
          hintText: 'instagram.com/',
        ),
        SizedBox(
          height: Get.width * 0.03,
        ),
        CustomTextField(
          textEditingController: domainNameController,
          hintText: 'www.domainname.com',
        ),
        SizedBox(
          height: Get.width * 0.03,
        ),
        CustomTextField(
          textEditingController: mobileNumber,
          hintText: 'Enter MobileNumber',
        ),
      ],
    );
  }
}
