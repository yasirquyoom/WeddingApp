import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/views/select_delete_view.dart';
import '../controllers/event_detail_controller.dart';

class LikedTabView extends GetView<EventDetailController> {
  LikedTabView({Key? key}) : super(key: key);
  EventDetailController eventDetailController =
      Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              Get.to(
                SelectDeleteView(
                  deleteIcons: false,
                ),
              );
            },
            child: Stack(
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
                  child: Image.asset(
                    "assets/icons/Play Button.png",
                    height: Get.width * 0.12,
                    width: Get.width * 0.12,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
