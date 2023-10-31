import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/views/you_shared_tab/user/creator/creator_you_shared_tab.dart';
import 'package:wedding_app/app/modules/event_detail/views/you_shared_tab/user/creator/photographer/photograpger_you_shared_tab.dart';
import 'package:wedding_app/app/modules/event_detail/views/you_shared_tab/user/creator/user/user_you_shared_tab.dart';
import 'package:wedding_app/main.dart';

import '../controllers/event_detail_controller.dart';

class YouSharedTabView extends GetView<EventDetailController> {
  const YouSharedTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return userCode == 2
        ? CreatorSharedTabView()
        : userCode == 1
            ? PhotographerYouSharedTabView()
            : UserYouShardTab();
  }
}

//     : Stack(
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(16),
// child: Image.file(
// height: Get.height,
// width: Get.width,
// fit: BoxFit.fill,
// File(
// controller.media[index - 1],
// ),
// ),
// ),
// Positioned(
// top: Get.width * 0.16,
// left: Get.width * 0.16,
// child: Image.asset(
// "assets/icons/Play Button.png",
// height: Get.width * 0.12,
// width: Get.width * 0.12,
// fit: BoxFit.fill,
// ),
// ),
// ],
// );