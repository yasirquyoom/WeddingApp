import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/event_detail_controller.dart';

class AllFilesView extends GetView<EventDetailController> {
  AllFilesView({Key? key}) : super(key: key);
  EventDetailController eventDetailController =
      Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/favourite1.png?alt=media&token=de7aee16-88d7-43f4-90b6-681d88e0b3e5",
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
        );
      },
    );
  }
}
