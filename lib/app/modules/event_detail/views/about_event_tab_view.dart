import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class AboutEventTabView extends GetView {
  const AboutEventTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.width * 0.63,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event1.png?alt=media&token=b65ac31e-a058-4eb6-b6ce-4f6c497f14bb",
                  fit: BoxFit.fill,
                  scale: 4,
                ),
              ),
            ),
            SizedBox(
              height: Get.width * 0.03,
            ),
            Text(
              "John and Julia Wedding",
              style: FontUtilities.h24(
                color: ColorUtilities.white,
                fontFamily: FontFamily.semiBoldInter,
              ),
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(
                "Yasir Quyoom",
                style: FontUtilities.h14(
                  color: ColorUtilities.white,
                  fontFamily: FontFamily.semiBoldInter,
                ),
              ),
              subtitle: Text(
                "user@example.com",
                style: FontUtilities.h14(
                  color: ColorUtilities.offWhite,
                  fontFamily: FontFamily.regularInter,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: ColorUtilities.white,
                radius: Get.width * 0.06,
                backgroundImage: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/event1.png?alt=media&token=b65ac31e-a058-4eb6-b6ce-4f6c497f14bb",
                ),
              ),
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            Text(
              "About Event",
              style: FontUtilities.h24(
                color: ColorUtilities.white,
                fontFamily: FontFamily.semiBoldInter,
              ),
            ),
            SizedBox(
              height: Get.width * 0.03,
            ),
            Text(
              "Introducing Forver-Event: Revolutionizing academia through a secure Blockchain Network. Empowering students and institutions with tamper-proof records, transparent credential verification, and efficient data sharing. Join us in shaping the future of education, where trust and innovation converge seamlessly. Discover a new era of academic integrity and collaboration. Welcome to the next generation of learning powered by Gradlit-Event's cutting-edge Blockchain Network.",
              style: FontUtilities.h16(
                color: ColorUtilities.white,
                fontFamily: FontFamily.regularInter,
              ),
            ),
            eventManagement(
              title: "Event mangement company",
              title1: "www.hillstudio.com",
              title2: "instagram.com/hillstudio",
              subtitle: "Hills Studio",
              image1: "assets/icons/global.png",
              image2: "assets/icons/instagram.png",
            ),
            eventManagement(
              title: "Venue",
              title1: "www.bookeventz.com",
              title2: "instagram.com/bookeventz",
              subtitle: "BookEventz Venues",
              image1: "assets/icons/global.png",
              image2: "assets/icons/instagram.png",
            ),
            eventManagement(
              title1: "Shivam Arora",
              title: "Photography Company",
              title2: "instagram.com/shivamarora",
              color: ColorUtilities.white,
              subtitle: "",
              image1: "assets/icons/profile.png",
              image2: "assets/icons/instagram.png",
            ),
            eventManagement(
              title: "Makeup Artist",
              title1: "Harris Jordan",
              color: ColorUtilities.white,
              title2: "instagram.com/harisjordan",
              subtitle: "",
              image1: "assets/icons/profile.png",
              image2: "assets/icons/instagram.png",
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            Text(
              "Other Services",
              style: FontUtilities.h18(
                color: ColorUtilities.white,
                fontFamily: FontFamily.semiBoldInter,
              ),
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            Text(
              "Cattering",
              style: FontUtilities.h16(
                color: ColorUtilities.white,
                fontFamily: FontFamily.regularInter,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eventManagement({
    required String subtitle,
    Color? color,
    required String title1,
    required String title,
    required String title2,
    required String image1,
    required String image2,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.width * 0.05,
        ),
        Text(
          title,
          style: FontUtilities.h18(
            color: ColorUtilities.white,
            fontFamily: FontFamily.semiBoldInter,
          ),
        ),
        subtitle.isEmpty
            ? SizedBox()
            : SizedBox(
                height: Get.width * 0.06,
              ),
        subtitle.isEmpty
            ? SizedBox()
            : Text(
                subtitle,
                style: FontUtilities.h16(
                    color: ColorUtilities.white,
                    fontFamily: FontFamily.regularInter),
              ),
        SizedBox(
          height: Get.width * 0.04,
        ),
        Row(
          children: [
            Image.asset(
              image1,
              scale: 4,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title1,
              style: FontUtilities.h16(
                fontFamily: FontFamily.regularInter,
                color: color ?? ColorUtilities.goldenColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.035,
        ),
        Row(
          children: [
            Image.asset(
              image2,
              scale: 4,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title2,
              style: FontUtilities.h16(
                fontFamily: FontFamily.regularInter,
                color: ColorUtilities.goldenColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.035,
        ),
      ],
    );
  }
}
