import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class DeletePhotoVideoSheet extends StatelessWidget {
  final String title;
  DeletePhotoVideoSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        height: Get.width * 0.7,
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorUtilities.offButtonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: FontUtilities.h16(
                    color: ColorUtilities.white,
                  ),
                ),
              ),
              Container(
                height: Get.width * 0.25,
                width: Get.width * 0.27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/photos.png?alt=media&token=c21f5578-0270-4cbf-92e5-4794c0142c70",
                  fit: BoxFit.fill,
                  height: Get.width * 0.25,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorUtilities.blackColor,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: FontUtilities.h16(
                              color: ColorUtilities.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.06,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorUtilities.goldenColor,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Center(
                          child: Text(
                            "Delete",
                            style: FontUtilities.h16(
                              color: ColorUtilities.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
