import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

import '../../../../utilities/asset_icons.dart';
import '../../event_detail/views/favorite_video.dart';
import 'favourites_image.dart';

class FavouritesView extends GetView<BottomBarController> {
  const FavouritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtilities.backgroundColor,
        centerTitle: false,
        title: Text(
          "Favourite",
          style: FontUtilities.h24(
            color: Colors.white,
            fontFamily: FontFamily.semiBoldInter,
          ),
        ),
      ),
      backgroundColor: ColorUtilities.backgroundColor,
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           buildAllEventBanner(
      //               width: Get.width * 0.45,
      //               height: Get.width * 0.45,
      //               radius: 16,
      //               imageUrl:
      //                   "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/favourite1.png?alt=media&token=de7aee16-88d7-43f4-90b6-681d88e0b3e5"),
      //           buildAllEventBanner(
      //               width: Get.width * 0.45,
      //               height: Get.width * 0.45,
      //               radius: 16,
      //               isVideos: true,
      //               imageUrl:
      //                   "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2037.png?alt=media&token=7ec18fbd-0e28-43cd-814a-ef38478c0f41")
      //         ],
      //       ),
      //       title(
      //           titleName: "Your Photos (By AI)",
      //           subTitle: "  Based on your selfie"),
      //       photoTile(
      //           imageUrl2:
      //               "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2046.png?alt=media&token=c71ce035-a644-4560-9ce9-f457063eaad6",
      //           imageUrl:
      //               "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2036%20(2).png?alt=media&token=5c19850b-00ec-40fe-96c2-f2c03fd06f3a",
      //           width: (Get.width - 30) * 0.6,
      //           height: Get.width * 0.4,
      //           fit: BoxFit.fill,
      //           radius: 16),
      //       title(
      //           titleName: "Family Wedding Photos",
      //           subTitle: "  Created on 12 Aug 2023"),
      //       photoTile(
      //           imageUrl2:
      //               "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2046.png?alt=media&token=c71ce035-a644-4560-9ce9-f457063eaad6",
      //           imageUrl:
      //               "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2036%20(2).png?alt=media&token=5c19850b-00ec-40fe-96c2-f2c03fd06f3a",
      //           width: (Get.width - 30) * 0.6,
      //           height: Get.width * 0.40,
      //           fit: BoxFit.fill,
      //           radius: 16),
      //       title(
      //           titleName: "Yasir Family Photos",
      //           subTitle: "  Created on 12 Aug 2023"),
      //       photoTile(
      //           imageUrl2:
      //               "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2046.png?alt=media&token=c71ce035-a644-4560-9ce9-f457063eaad6",
      //           imageUrl:
      //               "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/image%2036%20(2).png?alt=media&token=5c19850b-00ec-40fe-96c2-f2c03fd06f3a",
      //           width: (Get.width - 30) * 0.6,
      //           height: Get.width * 0.40,
      //           fit: BoxFit.fill,
      //           radius: 16),
      //       SizedBox(
      //         height: 15,
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(const FavouritesImageView());
            },
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event1.png?alt=media&token=b65ac31e-a058-4eb6-b6ce-4f6c497f14bb",
                      width: Get.width - 30,
                      height: ((Get.width - 30) * 0.71),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: ((Get.width - 30) * 0.71) - 48,
                    ),
                    width: Get.width,
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
                      horizontal: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "All Photos",
                          style: FontUtilities.h16(
                              color: ColorUtilities.white,
                              fontFamily: FontFamily.semiBoldInter),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: ColorUtilities.goldenColor,
                            ),
                            Text(
                              "  8270 Photos",
                              style: FontUtilities.h12(
                                color: ColorUtilities.white,
                                fontFamily: FontFamily.regularInter,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.width * 0.04,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.width * 0.05,
          ),
          GestureDetector(
            onTap: () {
              Get.to(const FavouritesVideoView());
            },
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event1.png?alt=media&token=b65ac31e-a058-4eb6-b6ce-4f6c497f14bb",
                      width: Get.width - 30,
                      height: ((Get.width - 30) * 0.71),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/icons/Play Button.png",
                    scale: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: ((Get.width - 30) * 0.71) - 48,
                    ),
                    width: Get.width,
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
                      horizontal: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "All Videos",
                          style: FontUtilities.h16(
                              color: ColorUtilities.white,
                              fontFamily: FontFamily.semiBoldInter),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: ColorUtilities.goldenColor,
                            ),
                            Text(
                              "  8270 Photos",
                              style: FontUtilities.h12(
                                color: ColorUtilities.white,
                                fontFamily: FontFamily.regularInter,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.width * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget title({required String titleName, required String subTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleName,
                style: FontUtilities.h16(
                    color: ColorUtilities.white,
                    fontFamily: FontFamily.semiBoldInter),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: ColorUtilities.goldenColor,
                  ),
                  Text(subTitle,
                      style: FontUtilities.h12(
                          color: ColorUtilities.offWhite,
                          fontFamily: FontFamily.regularInter)),
                ],
              ),
            ],
          ),
          addButton()
        ],
      ),
    );
  }

  Widget buildAllEventBanner(
      {required double height,
      required double width,
      double? radius,
      bool isVideos = false,
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
        isVideos
            ? Positioned(
                top: (height / 2) - Get.width * 0.12,
                left: (width / 2) - Get.width * 0.04,
                child: Image.asset("assets/icons/Play Button.png",
                    height: Get.width * 0.11,
                    width: Get.width * 0.11,
                    fit: BoxFit.fill),
              )
            : Container(),
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
                Text(
                  "All Photos",
                  style: FontUtilities.h14(
                      color: ColorUtilities.white,
                      fontFamily: FontFamily.mediumInter),
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
                    Text(" 12 Photos   ",
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
    );
  }

  Widget photoTile(
      {BoxFit fit = BoxFit.contain,
      required String imageUrl,
      required String imageUrl2,
      required double height,
      required double width,
      required double radius}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius ?? 0),
                  child: Image.network(
                    imageUrl2,
                    width: width * 0.59,
                    height: height,
                    fit: fit,
                  ),
                ),
              ),
              Container(
                width: width * 0.59,
                height: height,
                decoration: BoxDecoration(
                    color: ColorUtilities.offButtonColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(radius ?? 0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "50+",
                      style: FontUtilities.h20(
                          color: ColorUtilities.white,
                          fontFamily: FontFamily.semiBoldInter),
                    ),
                    Text(
                      "View All",
                      style: FontUtilities.h14(
                          color: ColorUtilities.white,
                          fontFamily: FontFamily.mediumInter),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget addButton() {
    return Row(
      children: [
        Icon(
          Icons.add,
          size: 25,
          color: ColorUtilities.goldenColor,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "Add",
          style: FontUtilities.h16(
              color: ColorUtilities.goldenColor,
              fontFamily: FontFamily.semiBoldInter),
        )
      ],
    );
  }
}
