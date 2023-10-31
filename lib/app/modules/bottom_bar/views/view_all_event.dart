import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';

import '../../../../utilities/font_utilities.dart';
import '../../../../utilities/widget/custom_app_bar.dart';

class ViewAllEvent extends GetView<BottomBarController> {
  const ViewAllEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: customAppBar(
        title: "View all events",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: buildRecentEventBanner(
                radius: 23,
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event2.png?alt=media&token=c5c42396-f27a-4a77-8466-082528dc7c2c",
                width: Get.width - 30,
                height: ((Get.width - 30) * 0.71),
              ),
            );
          },
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
}
