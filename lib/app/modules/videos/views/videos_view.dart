import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wedding_app/utilities/asset_icons.dart';

import 'package:wedding_app/utilities/color_utilities.dart';

import 'package:wedding_app/utilities/widget/delete_photo_video_dialog.dart';

import '../controllers/videos_controller.dart';

class VideosView extends GetView<VideosController> {
  VideosView({Key? key}) : super(key: key);
  VideosController videosController = Get.put(VideosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtilities.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<VideosController>(
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child:
                            controller.videoPlayerController!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: 16/9,
                                    child: Chewie(
                                      controller: controller.cheWieController!,
                                    ),
                                  )
                                : Container(),
                      ),
                      // Align(
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       controller.videoPlayerController!.value.isPlaying
                      //           ? controller.videoPlayerController!.pause()
                      //           : controller.videoPlayerController!.play();
                      //       controller.isPlaying =! controller.isPlaying;
                      //     },
                      //     child: Container(
                      //       height: Get.width*0.15,
                      //       width: Get.width*0.15,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(30),
                      //         color: ColorUtilities.goldenColor,
                      //       ),
                      //       child: Icon(
                      //         controller.videoPlayerController!.value.isPlaying
                      //             ? Icons.pause
                      //             : Icons.play_arrow,
                      //         size: 25,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/img/arrow_down _square.png",
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.rotateImage();
                        },
                        child: Image.asset(
                          AssetIcons.rotateIcon,
                          height: 25,
                          width: 25,
                          fit: BoxFit.fill,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            isScrollControlled: true,
                            DeletePhotoVideoSheet(
                              title:
                                  "Are you sure you want to Delete this video ?",
                            ),
                          );
                        },
                        child: Image.asset(
                          AssetIcons.deleteIcon,
                          height: 25,
                          width: 25,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Image.asset(
                        "assets/img/heart.png",
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
