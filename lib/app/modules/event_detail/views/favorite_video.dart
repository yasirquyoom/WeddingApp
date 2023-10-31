import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

import '../../../../utilities/asset_icons.dart';
import '../../event_detail/views/select_delete_view.dart';

class FavouritesVideoView extends GetView<BottomBarController> {
  const FavouritesVideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtilities.backgroundColor,
        centerTitle: false,
        title: Text(
          "Favourite Video",
          style: FontUtilities.h24(
            color: Colors.white,
            fontFamily: FontFamily.semiBoldInter,
          ),
        ),
      ),
      backgroundColor: ColorUtilities.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                Get.to(SelectDeleteView());
              },
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/videos");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/favourite1.png?alt=media&token=de7aee16-88d7-43f4-90b6-681d88e0b3e5",
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.width * 0.16,
                    left: Get.width * 0.16,
                    child: Image.asset("assets/icons/Play Button.png",
                        height: Get.width * 0.12,
                        width: Get.width * 0.12,
                        fit: BoxFit.fill),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
