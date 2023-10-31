import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import '../../event_detail/views/select_delete_view.dart';
import '../controllers/ai_view_controller.dart';

class AiAlbumView extends GetView<AiViewController> {
  AiAlbumView({Key? key}) : super(key: key);
  AiViewController eventDetailController = Get.put(AiViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiViewController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    controller.imagePath == null
                        ? SizedBox()
                        : SizedBox(
                            height: Get.width * 0.06,
                          ),
                    controller.imagePath == null
                        ? SizedBox()
                        : Text(
                            "Upload your selfie or image",
                            style: FontUtilities.h18(
                              color: ColorUtilities.white,
                              fontFamily: FontFamily.semiBoldInter,
                            ),
                          ),
                    controller.imagePath == null
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text(
                              "So that i can help you to find that image that you are looking for.",
                              textAlign: TextAlign.center,
                              style: FontUtilities.h16(
                                color: ColorUtilities.grayColor,
                              ),
                            ),
                          ),
                    controller.imagePath == null
                        ? SizedBox()
                        : SizedBox(
                            height: Get.width * 0.10,
                          ),
                    controller.imagePath == null
                        ? SizedBox()
                        : Stack(
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 20),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.imagePath = null;
                                                  },
                                                  child: Container(
                                                    width: Get.width * 0.12,
                                                    height: Get.width * 0.12,
                                                    decoration: BoxDecoration(
                                                      color: ColorUtilities
                                                          .offBlack
                                                          .withOpacity(0.6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                left:
                                    (((Get.width - 40) / 2) - Get.width * 0.15),
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
                                        "Loding...",
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
                    controller.imagePath == null
                        ? SizedBox()
                        : SizedBox(
                            height: Get.width * 0.08,
                          ),
                    controller.imagePath == null
                        ? SizedBox()
                        : Text(
                            "We find only ${controller.media.length} images from whole album.",
                            style: FontUtilities.h18(
                              color: ColorUtilities.white,
                              fontFamily: FontFamily.semiBoldInter,
                            ),
                          ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    GridView.builder(
                      itemCount: controller.media.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {
                            Get.to(SelectDeleteView());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorUtilities.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                File(controller.media[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              controller.imagePath == null
                  ? SizedBox()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: Get.width * 0.12,
                                decoration: BoxDecoration(
                                  color: ColorUtilities.offButtonColor,
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Center(
                                  child: Text(
                                    "Discard",
                                    style: FontUtilities.h16(
                                      color: ColorUtilities.white,
                                      fontFamily: FontFamily.mediumInter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            Expanded(
                              child: Container(
                                height: Get.width * 0.12,
                                decoration: BoxDecoration(
                                  color: ColorUtilities.goldenColor,
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Center(
                                  child: Text(
                                    "Add to Album",
                                    style: FontUtilities.h16(
                                      color: ColorUtilities.blackColor,
                                      fontFamily: FontFamily.mediumInter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
