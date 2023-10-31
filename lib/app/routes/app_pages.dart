import 'package:get/get.dart';

import '../modules/add_users/bindings/add_users_binding.dart';
import '../modules/add_users/views/add_users_view.dart';
import '../modules/ai_view/bindings/ai_view_binding.dart';
import '../modules/ai_view/views/ai_tab_view.dart';
import '../modules/bottom_bar/bindings/bottom_bar_binding.dart';
import '../modules/bottom_bar/views/bottom_bar_view.dart';
import '../modules/crate_event/bindings/crate_event_binding.dart';
import '../modules/crate_event/views/crate_event_view.dart';
import '../modules/edit_crate_event/bindings/edit_crate_event_binding.dart';
import '../modules/edit_crate_event/views/edit_crate_event_view.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp_verify/bindings/otp_verify_binding.dart';
import '../modules/otp_verify/views/otp_verify_view.dart';
import '../modules/phoneLogIn/bindings/phone_log_in_binding.dart';
import '../modules/phoneLogIn/views/phone_log_in_view.dart';
import '../modules/photos/bindings/photos_binding.dart';
import '../modules/photos/views/photos_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/videos/bindings/videos_binding.dart';
import '../modules/videos/views/videos_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_LOG_IN,
      page: () => const PhoneLogInView(),
      binding: PhoneLogInBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => OtpVerifyView(),
      binding: OtpVerifyBinding(),
    ),
    GetPage(
      name: _Paths.CRATE_EVENT,
      page: () => const CrateEventView(),
      binding: CrateEventBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USERS,
      page: () => AddUsersView(),
      binding: AddUsersBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.PHOTOS,
      page: () => const PhotosView(),
      binding: PhotosBinding(),
    ),
    GetPage(
      name: _Paths.VIDEOS,
      page: () => VideosView(),
      binding: VideosBinding(),
    ),
    GetPage(
      name: _Paths.AI_VIEW,
      page: () => AiView(),
      binding: AiViewBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CRATE_EVENT,
      page: () => const EditCrateEventView(),
      binding: EditCrateEventBinding(),
    ),
  ];
}
