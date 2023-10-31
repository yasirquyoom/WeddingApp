import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:wedding_app/app/modules/ai_view/controllers/ai_view_controller.dart';
import 'package:wedding_app/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:wedding_app/app/modules/ai_view/views/ai_tab_view.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/tabs/2023_all_event.dart';
import 'package:wedding_app/app/modules/bottom_bar/views/view_all_event.dart';
import 'package:wedding_app/utilities/asset_icons.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class AllEventView extends GetView<BottomBarController> {
  const AllEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/app_name.png",
                    width: Get.width * 0.45,
                    height: 45,
                    fit: BoxFit.fill,
                  ),
                  Spacer(),
                  Image.asset(
                    AssetIcons.searchIcon,
                    height: Get.width * 0.07,
                    width: Get.width * 0.07,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Image.asset(
                    AssetIcons.notificationIcon,
                    height: Get.width * 0.07,
                    width: Get.width * 0.06,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Recent Events",
                      style: FontUtilities.h24(
                          color: ColorUtilities.white,
                          fontFamily: FontFamily.semiBoldInter),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/event-detail");
                    },
                    child: buildRecentEventBanner(
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event1.png?alt=media&token=b65ac31e-a058-4eb6-b6ce-4f6c497f14bb",
                      width: Get.width - 30,
                      radius: 23,
                      height: ((Get.width - 30) * 0.71),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  buildRecentEventBanner(
                    radius: 23,
                    imageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event2.png?alt=media&token=c5c42396-f27a-4a77-8466-082528dc7c2c",
                    width: Get.width - 30,
                    height: ((Get.width - 30) * 0.71),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "All Events",
                          style: FontUtilities.h24(
                            color: ColorUtilities.white,
                            fontFamily: FontFamily.semiBoldInter,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const ViewAllEvent());
                          },
                          child: Text(
                            "View all",
                            style: FontUtilities.h18(
                                color: ColorUtilities.goldenColor,
                                fontFamily: FontFamily.semiBoldInter),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.width * 0.65,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: buildAllEventBanner(
                            onTap: () {
                              Get.to(() => const AllEvent2023View());
                            },
                            radius: 16,
                            imageUrl:
                                "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2036%20(1).png?alt=media&token=c19efb5f-cafa-433b-8ab4-8046a3cf552b",
                            width: Get.width * 0.7,
                            fit: BoxFit.fill,
                            height: Get.width * 0.7,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => AiView(),
                              arguments: TabSelected(secondTabSelected: false),
                            );
                          },
                          child: Container(
                            width: (Get.width - 45) * 0.7,
                            height: Get.width * 0.45,
                            decoration: BoxDecoration(
                              color: ColorUtilities.offButtonColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset(
                              "assets/img/galleryImage.png",
                              scale: 4,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => AiView(),
                              arguments: TabSelected(secondTabSelected: true),
                            );
                          },
                          child: Container(
                            width: (Get.width - 45) * 0.3,
                            height: Get.width * 0.45,
                            decoration: BoxDecoration(
                              color: ColorUtilities.offButtonColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/aiImage.png",
                                  scale: 4,
                                ),
                                SizedBox(
                                  height: Get.width * 0.03,
                                ),
                                Text(
                                  "50 +",
                                  style: FontUtilities.h14(
                                    color: ColorUtilities.white,
                                    fontFamily: FontFamily.mediumInter,
                                  ),
                                ),
                                Text(
                                  "View All",
                                  style: FontUtilities.h16(
                                    color: ColorUtilities.white,
                                    fontFamily: FontFamily.mediumInter,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildRecentEventBanner(
      {required double height,
      required double width,
      double? radius,
      BoxFit? fit,
      required String imageUrl}) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.network(
              imageUrl,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: Get.width * 0.045,
                    backgroundImage: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/dummy_profile.png?alt=media&token=f8d3381c-573e-4d8b-9047-e079b20f33ce",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Get.width * 0.058,
                    ),
                    child: CircleAvatar(
                      radius: Get.width * 0.045,
                      backgroundColor: ColorUtilities.goldenColor,
                      child: Text("1K+",
                          style: FontUtilities.h12(
                              fontFamily: FontFamily.regularInter,
                              color: ColorUtilities.backgroundColor)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Members",
                style: FontUtilities.h12(
                    color: ColorUtilities.white,
                    fontFamily: FontFamily.regularInter),
              )
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: height - 50),
            width: width,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorUtilities.offButtonColor.withOpacity(0),
                ColorUtilities.offButtonColor.withOpacity(1),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "John and Julia Wedding",
                  style: FontUtilities.h16(
                      color: ColorUtilities.white,
                      fontFamily: FontFamily.semiBoldInter),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: ColorUtilities.goldenColor,
                    ),
                    Text(" 1300 Media files ",
                        style: FontUtilities.h12(
                            color: ColorUtilities.white,
                            fontFamily: FontFamily.regularInter)),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: ColorUtilities.goldenColor,
                    ),
                    Text(" 15 Aug 2023",
                        style: FontUtilities.h12(
                            color: ColorUtilities.white,
                            fontFamily: FontFamily.regularInter)),
                  ],
                ),
                SizedBox(
                  height: 7,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildAllEventBanner(
      {required double height,
      required double width,
      double? radius,
      required Function() onTap,
      BoxFit? fit,
      required String imageUrl}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 0),
              child: Image.network(
                imageUrl,
                width: width,
                height: height,
                fit: fit,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GlassmorphicContainer(
                width: Get.width * 0.13,
                height: Get.width * 0.13,
                borderRadius: 10,
                linearGradient: LinearGradient(
                  colors: [
                    ColorUtilities.offButtonColor.withOpacity(0.4),
                    ColorUtilities.offBlack.withOpacity(0.2),
                  ],
                ),
                borderGradient: LinearGradient(
                  colors: [
                    ColorUtilities.offBlack.withOpacity(0.1),
                    ColorUtilities.offBlack.withOpacity(0.1),
                  ],
                ),
                border: 1,
                blur: 3,
                child: Center(
                  child: Text(
                    "2023",
                    style: FontUtilities.h14(
                      color: ColorUtilities.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: height - 70),
              width: width,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  ColorUtilities.offButtonColor.withOpacity(0),
                  ColorUtilities.offButtonColor.withOpacity(1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius ?? 0),
                  bottomRight: Radius.circular(radius ?? 0),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: ColorUtilities.goldenColor,
                      ),
                      Text(" 12 Events   ",
                          style: FontUtilities.h12(
                              color: ColorUtilities.white,
                              fontFamily: FontFamily.regularInter)),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: ColorUtilities.goldenColor,
                      ),
                      Text(" 1300 Media files ",
                          style: FontUtilities.h12(
                              color: ColorUtilities.white,
                              fontFamily: FontFamily.regularInter)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
