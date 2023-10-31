import 'package:get/get.dart';

class PhotosController extends GetxController {
  double _rotationAngle = 0.0;

  double get rotationAngle => _rotationAngle;

  set rotationAngle(double value) {
    _rotationAngle = value;
    update();
  }

  rotateImage() {
    rotationAngle += 90.0; // Rotate 90 degrees clockwise
    if (rotationAngle == 360.0) {
      rotationAngle = 0.0;
    }
    update();
  }
}
