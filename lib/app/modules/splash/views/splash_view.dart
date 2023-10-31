import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      body: GetBuilder<SplashController>(builder: (_) {
        return Center(
          child: Image.asset("assets/img/logo.png",
              width: 137, height: 79, fit: BoxFit.fill),
        );
      }),
    );
  }
}
