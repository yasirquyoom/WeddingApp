import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/controllers/event_detail_controller.dart';

class PhotographerAllPhotoTab extends GetView<EventDetailController> {
  EventDetailController eventDetailController =
      Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed("/photos");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/favourite1.png?alt=media&token=de7aee16-88d7-43f4-90b6-681d88e0b3e5",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
