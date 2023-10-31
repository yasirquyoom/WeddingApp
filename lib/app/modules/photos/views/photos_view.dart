import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/asset_icons.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/widget/delete_photo_video_dialog.dart';

import '../controllers/photos_controller.dart';

class PhotosView extends GetView<PhotosController> {
  const PhotosView({Key? key}) : super(key: key);
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
        child: GetBuilder<PhotosController>(builder: (_) {
          return Column(
            children: [
              Expanded(
                child: Transform.rotate(
                  angle: controller.rotationAngle * (3.14159265359 / 180),
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/photos.png?alt=media&token=c21f5578-0270-4cbf-92e5-4794c0142c70"),
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
                                "Are you sure you want to Delete this picture ?",
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
        }),
      ),
    );
  }
}
