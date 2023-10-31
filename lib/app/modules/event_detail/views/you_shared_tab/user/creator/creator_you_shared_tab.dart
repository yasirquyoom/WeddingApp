import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/controllers/event_detail_controller.dart';
import 'package:wedding_app/app/modules/event_detail/views/you_shared_tab/user/creator/add_media_button.dart';

import '../../../../../../../utilities/color_utilities.dart';
import '../../../select_delete_view.dart';

class CreatorSharedTabView extends GetView<EventDetailController> {
  const CreatorSharedTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
      builder: (controller) {
        return GridView.builder(
          itemCount: controller.media.length + 1,
          padding:
              const EdgeInsets.only(bottom: 20, left: 15, right: 15, top: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
          itemBuilder: (context, index) {
            log('===${controller.media.length}');
            return index == 0
                ? AddMediaButtonWidget(
                    onTap: () {
                      controller.getImage();
                    },
                  )
                : GestureDetector(
                    onLongPress: () {
                      Get.to(SelectDeleteView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorUtilities.offButtonColor,
                      ),
                      child: Image.file(
                        File(controller.media[index - 1]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
