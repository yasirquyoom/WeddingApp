import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideosController extends GetxController {
  VideoPlayerController? _videoPlayerController;

  VideoPlayerController? get videoPlayerController => _videoPlayerController;

  set videoPlayerController(VideoPlayerController? value) {
    _videoPlayerController = value;
    update();
  }

  ChewieController? _cheWieController;

  ChewieController? get cheWieController => _cheWieController;

  set cheWieController(ChewieController? value) {
    _cheWieController = value;
    update();
  }

  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  set isPlaying(bool value) {
    _isPlaying = value;
    update();
  }

  @override
  void onInit() {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    )..initialize().then(
        (_) {
          log('message=======message');
          update();
        },
      );

    // videoPlayerController?.addListener(() {
    //   log("=====isCompleted======${videoPlayerController?.value.isCompleted}");
    // });

    cheWieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      aspectRatio: 16 / 9,
    );
    log('message');
    super.onInit();
  }

  @override
  void onClose() {
    _videoPlayerController?.dispose();
    _cheWieController?.dispose();
    super.onClose();
  }

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