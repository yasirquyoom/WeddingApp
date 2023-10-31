import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/crate_event/views/payment_page.dart';
import 'package:wedding_app/app/modules/edit_crate_event/controllers/edit_crate_event_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';
import 'package:wedding_app/utilities/widget/custom_textfield.dart';
import '../../crate_event/controllers/crate_event_controller.dart';

class EditEventDetailView extends GetView<EditCrateEventController> {
  EditEventDetailView({Key? key}) : super(key: key);

  EditCrateEventController editCrateEventController =
      Get.put(EditCrateEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: customAppBar(
        title: "Event management details",
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18),
        child: customButton(
          onTap: () {},
          isDisable: false,
          title: "Continue",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<EditCrateEventController>(
            builder: (controller) {
              return Column(
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
                    textEditingController: controller.mangeInstagramController,
                    hintText: 'instagram.com/',
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
                    textEditingController: controller.venueInstagramController,
                    hintText: 'E.g BookEventz Venues',
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  CustomTextField(
                    textEditingController: controller.venueInstagramController,
                    hintText: 'www.domainname.com',
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  CustomTextField(
                    textEditingController: controller.venueInstagramController,
                    hintText: 'instagram.com/',
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
                    textEditingController: controller.makeUpInstagramController,
                    hintText: 'instagram.com/',
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
                          categoryController: controller.vendorList[index][1],
                          domainNameController: controller.vendorList[index][3],
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
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildVendorTile(
      {required Function() onDeleteTap,
      required TextEditingController nameController,
      required TextEditingController categoryController,
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
      ],
    );
  }
}
